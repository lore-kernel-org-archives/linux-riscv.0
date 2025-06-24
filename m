Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22409C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zc7diMMsP94bRlU0nhGmCeSTN0ipPyyeXEhFFFJKQTM=; b=bV7M/4ynwrvyzJ
	X7DBYnMd9nLkaO74+syv9dTE5EDWtSPTPbsZ0us/MI0WN44zgrnW/aXgIH46xR55Lk5zpaFuCcKps
	km7N7e8ar2rA4L5weFMJjO7/PODPOQwUWxZt+IBMJasQtJa+XC9zPgbzizouxpz3B0zEuBJhbbyWL
	8/JJjNqe7aoSbKtE8QtQHWbDc+bEGK9gVHlnISFt+4SKgCT3vorhnRLJ1qyBIKKenR/CKoft9vrRP
	x1Ex7VNgPEx9mex8YB3qBwUJUQJtBU4MvJyMsalPHzab2GiI2gHj1s866dyIYomHrVJdYYRhN9aFn
	j5sbNjdrDpCt7fCg+T/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU39D-00000005e1O-0EpO;
	Tue, 24 Jun 2025 12:53:11 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU388-00000005dm3-2G2x
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 12:52:07 +0000
Received: from [192.168.0.107] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowACnWNdnn1po+ZrnCA--.56515S2;
	Tue, 24 Jun 2025 20:51:53 +0800 (CST)
Message-ID: <78227da5-52a9-4378-a6b2-4b2e01444399@iscas.ac.cn>
Date: Tue, 24 Jun 2025 20:51:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
To: Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>,
 Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
 <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com>
X-CM-TRANSID: qwCowACnWNdnn1po+ZrnCA--.56515S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jr1rZw1fur1fCFy5CFyUJrb_yoW8Jr1rpa
	9xXFsxGw1ktr48JrWqvF1qgrWvgrsYvF48WryDG3Z8ZFWDXF1IgF4Skry7try2grn5Aw1F
	yFsYva4v9F15XrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j1rWrUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_055204_950139_0B6C9037 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDYvMjQvMjUgMjA6MjEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMjMsIDIw
MjUgYXQgNjowNOKAr1BNIFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4gd3Jv
dGU6Cj4+IFVBUlQgZGV2aWNlcyBpbiBTcGFjZW1pdCBLMSB1c2UgZG1hLWJ1cyBETUEgdHJhbnNs
YXRpb25zLiBNb3ZlIHRoZXNlCj4+IG5vZGVzIHVuZGVyIGRtYS1idXMgdG8gcmVmbGVjdCB0aGlz
IGZhY3QuCi4uLgo+Pgo+PiAtICAgICAgICAgICAgICAgc2VjX3VhcnQxOiBzZXJpYWxAZjA2MTIw
MDAgewo+PiAtICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGsx
LXVhcnQiLCAiaW50ZWwseHNjYWxlLXVhcnQiOwo+PiAtICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwIDB4ZjA2MTIwMDAgMHgwIDB4MTAwPjsKPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDw0Mz47Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLWZy
ZXF1ZW5jeSA9IDwxNDg1NzAwMD47Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJlZy1zaGlm
dCA9IDwyPjsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnLWlvLXdpZHRoID0gPDQ+Owo+
PiAtICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAicmVzZXJ2ZWQiOyAvKiBmb3IgVEVF
IHVzYWdlICovCj4+IC0gICAgICAgICAgICAgICB9Owo+PiAtCj4gQXJlIHlvdSBzdXJlIHNlY191
YXJ0MSBzaG91bGQgYmUgcGxhY2VkIHVuZGVyIHRoZSBkbWFfYnVzPyBQbGVhc2UgZG91YmxlCj4g
Y2hlY2suIElmIHNlY191YXJ0MSBhbmQgb3RoZXIgcGVyaXBoZXJhbHMgc3VwcG9ydGVkIGJ5IHRo
ZSBzZWN1cmUgRE1BCj4gKGJhc2UgYWRkcmVzczogMHhGMDYwMDAwMCkgc2hhcmUgdGhlIHNhbWUg
YWRkcmVzcyBtYXBwaW5nIGFzIGRtYV9idXMsIGFuZAo+IGlmIHRoZXkgY2FuIGJlIGFjY2Vzc2Vk
IGJ5IHRoZSBsaW51eCBrZXJuZWwgaW4gc29tZSBjYXNlcyAoYXMgc2F5aW5nCj4gJ3Jlc2VydmVk
JyksIHRoZW4gdGhhdCBtYWtlcyBzZW5zZS4gSWYgbm90LCBiZXR0ZXIgbm90IG1vdmUgdGhlbS4K
CkJpYW5idSdzIERUIGZyb20gU3BhY2VtaVQgWzFdIHNob3dzIHNlY191YXJ0MSB1c2luZyBkcmFt
X3JhbmdlNCwgYW5kIGl0IAptYWRlIHNlbnNlIHRvIG1lLiBIb3dldmVyIGp1c3QgdG8gYmUgc3Vy
ZSBJIHdpbGwgYXNrIFNwYWNlbWlUIGZvciAKY29uZmlybWF0aW9uLgoKVml2aWFuICJkcmFtZm9y
ZXZlciIgV2FuZwoKWzFdOiBodHRwczovL2dpdGVlLmNvbS9iaWFuYnUtbGludXgvbGludXgtNi42
L2Jsb2IvazEtYmwtdjIuMi55L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEteC5kdHNp
Cgo+IC0tCj4gR3VvZG9uZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
