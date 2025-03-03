Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB32C282C6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yjyu4RmZ6uQjxV+jRWZIorV99QKbAyOrQLB7NI3kcnk=; b=IL57ULuw3hrxQ0
	PsULBaconlNBuyLfQOy3EPBK0pMmnrlQTMIOsiYXFNftpiUtM0rRoMZtkjAfr0bJAXvLpzfhrzc7n
	4PlclRtlgHmHNPp3m2uD8UIe+L6QberEoXEMz3xyBbOtUrnrnJchpjlbIZEg6pVc5wIgRcceRMZTg
	DZqVyT2p/nd1nmLloHqyfmNt8A4xjjPW6lopDSkv48vjDeSXPFP3IBBDP0V/nSXQvB3tV4CVWQVO9
	OJDIp30VdNdgQ25eWtc6xFV4hW49LiNKiHbZBqggXCQSaZN8ugEzRj0UsTxDhszqW+0sBwS5hF1Qa
	/x35PQrp7buP5qyBQq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAbv-00000001wra-1bDN;
	Mon, 03 Mar 2025 18:33:51 +0000
Received: from server54.mybundlepay.com ([207.231.110.219])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAbt-00000001wqM-0vPR
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 18:33:50 +0000
Received: from mybundlepay.com (unknown [128.85.24.6])
	by server54.mybundlepay.com (Postfix) with ESMTPA id 6C2C38E8E0
	for <linux-riscv@lists.infradead.org>; Mon,  3 Mar 2025 18:32:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mybundlepay.com;
	s=202411; t=1741026768;
	bh=7xaMXvh9EHIAnwba/RqCyrlLkMMaGpd4o9A09AYayfU=;
	h=Reply-To:From:To:Subject:Date:From;
	b=SHUDwcbMKacG8YA1O9ZHW2Qv8yqmARKCSS3SqofWW9odUtWRtzxU7Tw4I7hX2pvAi
	 e1n2WOr9lZU6qQIm0A3q7qy+dHp2EibE3cmj1ZlvB/bK6+gn6pZjNvVXBr+nS5YXc4
	 3/d0njbfZb2SznbA2f9RJfypdqiTmpA5lJvKLydBYsCu8Wa7o9WNXnXcIAoTg3Om6d
	 E6YS7HdDmtnVy/7Q1AxI3GCDp93w0Dk/Fq1nYW8WELCkMuH2I8K08soWZFvh8aIMH2
	 uFe0n175q/yuvKQnHfldijCmHglq6v7GDHtmsYtKgxJf/StWPatWoZxppZeErpDw6I
	 LzhU7ncXT9/lQ==
From: Ms. Debby <do-not-reply-us@mybundlepay.com>
To: linux-riscv@lists.infradead.org
Subject: HELLO...
Date: 03 Mar 2025 18:32:48 +0000
Message-ID: <20250303183248.C920F096AEEF58BA@mybundlepay.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_103349_316624_51C57A31 
X-CRM114-Status: UNSURE (   0.01  )
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
Reply-To: debmartinez@yandex.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

You got it now?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
