Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DAAC25B0D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 03:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ta0AVLHwwt2uHJaubUFSJLg31HHhNb4lLeD+zRNonm0=; b=sksjiEILlk33vH0/i78zbrJ1Zy
	FFPynaD5G6/ox3Mu6Umzp0esZOYkJCxbvXTyPc7iXFhLuk9WSws1WSUgoIwys2XxCBit1w5PSPHzX
	HnDFUJaJg5jAmarACohWx7s/3P7RrUFSw9g/svzdqCANESViIWAUD7JlStdAl0zyVXzwI7N9RAEVN
	moy0duW/exDkqAS2aQRD5crvSS6WhsHwrJlRRYln04D5tl0kcJVg7cIPPiIHwSt0vlatFFH806QC/
	WRo7AXqFFcvywAHUQ9ptQ9HmWq0jS34IWBOZR9lT1wwT1UWRajv9yDPjVYSD0+042Tmq5M8SdGVdc
	F+Mi5WWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMLIw-00DWqj-4L; Fri, 12 Aug 2022 03:25:46 +0000
Received: from gproxy1-pub.mail.unifiedlayer.com ([69.89.25.95])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMLHJ-00DODj-FF
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 03:24:07 +0000
Received: from cmgw10.mail.unifiedlayer.com (unknown [10.0.90.125])
	by progateway3.mail.pro1.eigbox.com (Postfix) with ESMTP id 888CD100480A6
	for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 03:23:25 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id MLGeo0AuNCokGMLGeo1dhm; Fri, 12 Aug 2022 03:23:25 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=c8Nu/Txl c=1 sm=1 tr=0 ts=62f5c7ad
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=biHskzXt2R4A:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=AlKTREwLlB48cMmJLoYA:9
 a=QEXdDO2ut3YA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=S8uYWQx3EVNMjOIyYYU61Ar0ZsFCEYlJWNWlsODwWhs=; b=vZmZS1ph27cersStAkn2wc1tXG
	rI+FwQyPtohc4ocNEyz4LfRHEwoqTwvwH8iCae6ui2kQfEZHdrbikJQ+Y3G/aOF6ZlimrWGWWSBe9
	WN8hjYNS5wv1magar4dZy6hGXN7ea3uH2rs/tKytLivQ20lrUpO0E8A6ZAYB/Shv9Eto5GvCGf+WE
	r1LT2w0URrQPCq9UicARLYDpHwGkPdH//aBityTeOMqV4be1kjykrbHGG/5V3ZABEsdixP322fTN9
	nOkxX+YtOjSyLqORLQDkj+2xjFSBR7zXDotO1vquh9eG6eMUXGLMM+kEznAkjUw1yighOjqVPa8WB
	5hsqSy4Q==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:39398 helo=[10.0.1.48])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1oMLGd-000BFx-FM;
	Thu, 11 Aug 2022 21:23:23 -0600
Subject: Re: Apply f2928e224d85e7cc139009ab17cefdfec2df5d11 to 5.15 and 5.10?
To: Nathan Chancellor <nathan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Anup Patel <anup@brainfault.org>, stable@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <YvWduqRcPYhYZWMT@dev-arch.thelio-3990X>
From: Ron Economos <re@w6rz.net>
Message-ID: <9e2b9fbd-c597-f310-aad2-06c85c8ce31c@w6rz.net>
Date: Thu, 11 Aug 2022 20:23:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YvWduqRcPYhYZWMT@dev-arch.thelio-3990X>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1oMLGd-000BFx-FM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.48]) [73.162.232.9]:39398
X-Source-Auth: re@w6rz.net
X-Email-Count: 8
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_202405_696287_7713E1B7 
X-CRM114-Status: GOOD (  12.41  )
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

On 8/11/22 5:24 PM, Nathan Chancellor wrote:
> Hi all,
>
> Would it be reasonable to apply commit f2928e224d85 ("riscv: set default
> pm_power_off to NULL") to 5.10 and 5.15? I see the following issue when
> testing OpenSUSE's RISC-V configuration in QEMU and it is resolved with
> that change.
>
> Requesting system poweroff
> [    4.497128][  T177] reboot: Power down
> [   32.045207][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [init:177]
> [   32.045785][    C0] Modules linked in:
> [   32.046166][    C0] CPU: 0 PID: 177 Comm: init Not tainted 5.15.60-default #1 5b276f06901b1c37142db73337a1816290810c90
> [   32.046814][    C0] Hardware name: riscv-virtio,qemu (DT)
> [   32.047256][    C0] epc : default_power_off+0x1a/0x20
> [   32.047667][    C0]  ra : machine_power_off+0x22/0x2a
> [   32.047979][    C0] epc : ffffffff80004a4a ra : ffffffff80004abe sp : ffffffd000bc3d50
> [   32.048405][    C0]  gp : ffffffff81bec160 tp : ffffffe002080000 t0 : ffffffff80490964
> [   32.048827][    C0]  t1 : 0720072007200720 t2 : 50203a746f6f6265 s0 : ffffffd000bc3d60
> [   32.049245][    C0]  s1 : 000000004321fedc a0 : 0000000000000004 a1 : ffffffff81b073c8
> [   32.049676][    C0]  a2 : 0000000000000010 a3 : 00000000000000ab a4 : e0b1d187e51c7400
> [   32.050115][    C0]  a5 : ffffffff80004a30 a6 : c0000000ffffdfff a7 : ffffffff804ea464
> [   32.050555][    C0]  s2 : 0000000000000000 s3 : ffffffff81a20390 s4 : fffffffffee1dead
> [   32.051009][    C0]  s5 : ffffffff81bee0c8 s6 : 0000003feff55a70 s7 : 0000002acc09bf08
> [   32.051427][    C0]  s8 : 0000000000000001 s9 : 0000000000000000 s10: 0000002b0a4db6e0
> [   32.051849][    C0]  s11: 0000000000000000 t3 : ffffffe001e2bf00 t4 : ffffffe001e2bf00
> [   32.052274][    C0]  t5 : ffffffe001e2b000 t6 : ffffffd000bc3ac8
> [   32.052604][    C0] status: 0000000000000120 badaddr: 0000000000000000 cause: 8000000000000005
> qemu-system-riscv64: terminating on signal 15 from pid 2356237 (timeout)
>
> I am not sure if there is any regression potential with that change,
> hence this email. That change applies cleanly to both trees and I don't
> see any additional problems from it.
>
> Cheers,
> Nathan

Should be fine. I apply this patch to all of my 5.15.x stable builds to 
enable warm reboot on the HiFive Unmatched.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
