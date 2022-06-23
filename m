Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C86CC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pt//+mlPSwXzXm370dGr4ybZ8FE9LSwPEWE4DSao5V8=; b=2GdFvFJqaCy611nblFgGrG3Jvd
	ELmoezZAX2Hr6ZiVdHSQO8BMVBR14E19s8F9i+JmGT0Y2nzA+JewTJFhxRpg3IWtDeXVCQOfHMUsB
	D3ghkKQHjGinIj4YNuwisN6hJEUIBq9uHpSRHv+yYwHEm81+UjEdn7C+6tEJ5WdiMgmur2hCGowk+
	djPvnZnEc9TZgADVyUQ9SyAxU8aDgBPkCOhLk7axu5oH/MKq+sJzphcuqKs13lNmUfXrkjfp1C0UT
	RrINDPBssIpYS7n2819pZhp9uoCCBALcqFSHQI5r15HAFNKotiSyqoJg2AId9cVzsalUTdjn+o0wq
	QDOIJtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RIR-00GH4s-PG; Thu, 23 Jun 2022 18:11:15 +0000
Received: from smtp52.i.mail.ru ([94.100.177.112])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RIN-00GH2E-Sc
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 18:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Cc:To:Subject:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=o3PZIN3kz8OA33b9IW58T7UoeVNB5qrRWWmVPt8EtXA=;
	t=1656007871;x=1656613271; 
	b=LPnATncBB5skMQjFoYudJ/Wg92Ju7BlSFyN2iEJhStYBuUx3Nl2YP8StDql0yNvkP3IMMPoK15afZ/usFlmih4/ogNs4DiykOsrIA0QaCV9oUCIlTJR8x7l9BEQ83AAlrA67uh5mNOYvQO9lWVjrRsJw8Pk9QlBh5t3HC4TqKLy3AuB0WxBQW9EYLItpexCPyrc5SXWq8rKx9J1n9ooFVnCxZPJaIUwin9ctFhhhtMzKq9gUkabZu5AnhSZrDhOZ2MOmAOIYlR+D7E9kod/20yUBs981r36e2TnR5y0Y5Xe1IZxT/NN0vvez6Kpz/5pmwjnHmV/EBp323fTUyK4EqA==;
Received: by smtp52.i.mail.ru with esmtpa (envelope-from <cerg2010cerg2010@mail.ru>)
	id 1o4RIG-0000gr-KE; Thu, 23 Jun 2022 21:11:04 +0300
From: Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: Tickless timer regression in v5.18.3 on riscv
To: Samuel Holland <samuel@sholland.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, Sergey Larin <cerg2010cerg2010@mail.ru>
Message-ID: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru>
Date: Thu, 23 Jun 2022 21:11:03 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: ru
Authentication-Results: smtp52.i.mail.ru; auth=pass smtp.auth=cerg2010cerg2010@mail.ru smtp.mailfrom=cerg2010cerg2010@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9EAB0F1B3E0C6ABD312CF4D3018585872812946D701EDE94C182A05F538085040A0F370C5ED0CD6C9D35B673DD6F6B0727F83A9B26B72A1CEDAE241550A5BE2FC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74323F140F3EE5B6AC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7F2919D563845004AEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B8859CA687ABA27BAD083B08ECF8611E478CBD90FC7FC956020879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07C37DE3F426B52F18941B15DA834481F8AA50765F7900637FD2911E685725BF8389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637B5A204E478D185BAD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE70B9F383B0FC05EB1EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C31C94431981024FA535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5B877D0D74ACCACCF7A9D420A4CFB5DD3E8D95D7424A554FBABCEF28D603E63545DF002B50EF282735D59269BC5F550898DBE8DEE28BC9005C7925766A9C523AF3638A446BE3E5C627BF0CFE790FC11A72BA7CCD254A1CF5E8F04B387B5D7535DE410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342833AC5E8E9ACF1CF4D0DD664D85F61A0703D6FC3AB0BA9B4866CA7C797B58CA673DAB5A805990B11D7E09C32AA3244C3BB00ABFA8E3F43BBF1D5FC97433AE8BF522A1CF68F4BE0583B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj0at9oz1ZZJ8NszMpF/+IxA==
X-Mailru-Sender: B6CA852314BECD1116C83C047D515D65EE50EBEF06F47F1AAE7E43C8ABC4CFFA204B5EB19F9A0BE351913ECE9F5D4CE557914126969F3D9578C09B768FF42B7F4F0A872F021F9059A8B6234B51EB8B42C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_111112_459298_04EC1489 
X-CRM114-Status: UNSURE (   5.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

It appears that tickless timer regerssion was introduced in commit 
232ccac1bd9b5bfe73895f527c08623e7fa0752d ("clocksource/drivers/riscv: 
Events are stopped during CPU suspend").

Even though this is a fix for CPU suspend, it causes high idle CPU 
usage. However, this usage is not reported to userspace, but can be 
observed in virtual machines like QEMU or RVVM. So the kernel is not 
tickless now, disabling NO_HZ has the same effects.

Any ideas why this is needed since CLINT timers should be active in WFI?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
