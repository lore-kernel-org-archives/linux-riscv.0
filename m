Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BCFC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzrJWIT0+36I0wE0SjNHqjdZ/7NuAXcaOTwcWIBcbeM=; b=ve5m2wtukSCeIH
	4ug0wUaEAI6fO6lVH9j0dniyspDxgX5330DoXSzjtYSH3tCQhP3ja2DUSkA06llu0SkuPJnnCdgYI
	RM64u0yarjjUgQHxTcaBPw552ts5w4zHeFokaJ43vt6OyguxdlHUY0674n/gr9pCID2wLqlrXrxwr
	SzFSMzsSr7mI5M9gCeem/ym/HyESKjJCXEtCZKlS8SFQC+gZv30OJ5LxdlR2HQthBZgI3qylRXNgY
	4K8Jrzxfu8QlRaw8naUFLekyQAVldWx1rJll0DzcX0rP2OfixYXmIq9MZpsIM/skZA6iT+Tvj+1jT
	RpfdoaG9l6KSj9wkfO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohWJH-00FdG3-LN; Sun, 09 Oct 2022 13:25:39 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohWJE-00FdFL-Mz
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 13:25:38 +0000
Received: from [124.16.97.31] (unknown [124.16.97.31])
	by APP-05 (Coremail) with SMTP id zQCowAD3_7PMy0Jjb0_3Aw--.56419S3;
	Sun, 09 Oct 2022 21:25:33 +0800 (CST)
Message-ID: <2de46c94-0792-7a4b-5bcd-d57fffe1160c@iscas.ac.cn>
Date: Sun, 9 Oct 2022 21:25:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH v1 1/1] riscv: mm: add missing memcpy in kasan_init
To: Conor Dooley <conor@kernel.org>
Cc: atishp@atishpatra.org, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
References: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
 <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn> <Y0KwwUNpfC+JOhQR@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Y0KwwUNpfC+JOhQR@spud>
X-CM-TRANSID: zQCowAD3_7PMy0Jjb0_3Aw--.56419S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY37k0a2IF6F4UM7kC6x804xWl14x267AK
	xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I
	6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
	1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUco7KDUUUU
X-Originating-IP: [124.16.97.31]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwIODGNCTGb0bQAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_062537_139583_289CC55C 
X-CRM114-Status: GOOD (  10.71  )
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

On 10/9/22 7:30 PM, Conor Dooley wrote:
> On Sun, Oct 09, 2022 at 04:30:50PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Hi Atish,
>>
>> It seems that the panic is due to the missing memcpy during kasan_init.
>> Could you please check whether this patch is helpful?
> 
> If this does solve the problem it would be:
> Fixes: 8fbdccd2b173 ("riscv: mm: Support kasan for sv57")
> right?
> 
> Thanks,
> Conor.
> 

Hi Conor,

Thanks a lot for notification!
I have change the title and resend it.

Thanks,
Qinglin.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
