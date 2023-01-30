Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE84CC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8cwVsAw45/V9mDOxHF1GLEqAnlUUIZ/X0ImX4iXER/E=; b=juj/JWgKngfBSz
	0ZwTNkzSdbphqLR7lvXTq/yfuQO/kCZnSqdwD36bj6sW9x+uCGtt73GAHoXux3+4tPrLnrHUu2Hk8
	1OEDJpPX7XKaFbixoj/y4l4kon3cD2RbocUHMzVaRmI6IHgzBjP7V/Q6PjxashP9HRmjrUBu8NDM5
	o3Mu+tryvCHyF+reg2oiu1I4Ib0yLVycfxbA6xeW+PJDWNMdTA3OYqt7fu4Q8Ge3GLrXnf2THtew5
	qTT1BnhhMV31wSNIpqRBXsGxgelReCsJQVgF7tNzrpKjxnckDIZGRfPhjK4vaBEOh/HZWol3bdl+E
	gI8GK8YQd3X6WFb7JPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVJQ-003u8U-VE; Mon, 30 Jan 2023 14:39:12 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVJM-003u79-GG
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 14:39:12 +0000
Received: from smtpclient.apple (unknown [27.196.42.86])
	by APP-05 (Coremail) with SMTP id zQCowADn7vJz1tdj9GIBAw--.11917S2;
	Mon, 30 Jan 2023 22:38:45 +0800 (CST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v6 00/13] Add OPTPROBES feature on RISCV
From: Xim <chenguokai17@mails.ucas.ac.cn>
In-Reply-To: <87wn54i4pa.fsf@all.your.base.are.belong.to.us>
Date: Mon, 30 Jan 2023 22:38:42 +0800
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 rostedt@goodmis.org,
 mingo@redhat.com,
 sfr@canb.auug.org.au,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "liaochang (A)" <liaochang1@huawei.com>
Message-Id: <14608847-C2F3-4C5A-9801-34DAC933E895@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <87wn54i4pa.fsf@all.your.base.are.belong.to.us>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CM-TRANSID: zQCowADn7vJz1tdj9GIBAw--.11917S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYf7k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I
	6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
	1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWl
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zMKtUUUUU==
X-Originating-IP: [27.196.42.86]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCgoHE2PXbji7RAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_063908_946973_93428731 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQmrDtnJuLAoKCgo+IDIwMjPlubQx5pyIMzDml6UgMjA6MzHvvIxCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPiDlhpnpgZPvvJoKPiAKPiBDaGVuIEd1b2thaSA8Y2hlbmd1b2thaTE3
QG1haWxzLnVjYXMuYWMuY24+IHdyaXRlczoKPiAKPj4gQWRkIGp1bXAgb3B0aW1pemF0aW9uIHN1
cHBvcnQgZm9yIFJJU0MtVi4KPiAKPiBJJ2QgbGlrZSB0byB0YWtlIHRoZSBzZXJpZXMgZm9yIGEg
c3BpbiwgYnV0IEknbSBoYXZpbmcgdHJvdWJsZSBhcHBseWluZwo+IHRoZSB0aGUgcGF0Y2hlczsg
V2hhdCBiYXNlIGNvbW1pdCBkaWQgeW91IHVzZT8gT3IgcG9pbnQgbWUgdG8gYSBnaXQKPiByZXBv
LgoKSSBnZW5lcmF0ZWQgdGhpcyBwYXRjaCBzZXJpZXMgYmFzZWQgb24gbmV4dC0yMDIzMDEyNyB0
YWcKCj4gCj4gKEl0J3MgbmljZSB0byB1c2UgIi0tYmFzZSIgdG8gZ2l0LWZvcm1hdC1wYXRjaC4p
CgpJIHdpbGwgdGFrZSB0aGlzIHBhcmFtZXRlciBpbiBhbnkgZm9sbG93aW5nIHJldmlzaW9ucywg
dGhhbmtzIQoKPiAKPiAKPiBUaGFua3MhCj4gQmrDtnJuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
