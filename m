Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270FDC7EE2F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 03:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdpmCarcsYvtLx/Vw/drpTqbjQuvjP4FlrFDsApRHb0=; b=A5TMi6otc05Sdj
	JZ/eh6sQdR+VhfJb5NhXPshJhfx71tBHmdLmciRl/s0cSsexsAOvlCLIfF2U6od5JADThgkUqPZbu
	+z6/9tfx4zYYxgB3YLTI+VDPDG7DLMXjc0Bm5MkzAHEEliJLj0b57bvRbTucHCmlsTt5BpVWnVdJR
	9MGfMIQZiN6+sPqCLsUTiEU7KPCxmRAegptRZV8d1d3vTo303RNhrBBoSiyytP71kEZWWiUKSnbRK
	LVCH/OlSIexCJpTl/C5GBkk8OZAVPuu2eNy3Gt1IQrse5Tm3z/AhWBhAzKmCT12Zr3DP87qm8PO1i
	NOe6aCkdKW/HwoI5V4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6jPx-0045tG-0i;
	Wed, 07 Jun 2023 03:01:01 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6jPu-0045rR-0q
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 03:00:59 +0000
X-QQ-mid: bizesmtp71t1686106811ti8n2dsz
Received: from [192.168.1.114] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Jun 2023 11:00:08 +0800 (CST)
X-QQ-SSF: 00200000000000807000000A0000000
X-QQ-FEAT: cbck7jzG4waKVMffVip+VyqfV5Z36XYIUvLy0PixwlM0lc1yqZ0MZuNefq0R5
	XtFnqTSYdCssVL8QKKhB2ihmwNy6PVhh862+9YYdeAQFjCdonGUL/OL7FbB/q7YPFEjqEWv
	eGnjSP52p5KSCq8bxRWwieHOQS88L7Ov+83woYZUaMOBp0rxFm/aF8OMTvRT7V+pG6zliri
	cmU35qMRkfTcHucla9hps2AScHZSmtFZA58IRs16u1G3DH0HCYaNggO9b3xCmT3jRTu20fd
	9iedYBpZ3uPzEMDqx2EhRdYbiaxId3tVmaqCJOYZmo4gqpE4wUzx7v7xX+iaSsxY7IJm0U6
	Dkjvs6DK0+0jBtFMeKh/un1tmU5T8y2sbALpcM86sPuJULJbfk=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17331428298007680521
Message-ID: <A8B3B45A0174F0B8+98d9d1e1-fe9f-9173-e5a7-b31113da861a@tinylab.org>
Date: Wed, 7 Jun 2023 11:00:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] arm64: hibernate: remove WARN_ON in
 save_processor_state
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, chris@zankel.net, jcmvbkbc@gmail.com,
 steven.price@arm.com, vincenzo.frascino@arm.com, pcc@google.com,
 wangxiang@cdjrlc.com, ajones@ventanamicro.com, conor.dooley@microchip.com,
 jeeheng.sia@starfivetech.com, leyfoon.tan@starfivetech.com,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230525025555.24104-1-songshuaishuai@tinylab.org>
 <20230525025555.24104-3-songshuaishuai@tinylab.org>
 <20230605142857.GE21212@willie-the-truck>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <20230605142857.GE21212@willie-the-truck>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_200058_616521_A02C4938 
X-CRM114-Status: GOOD (  12.10  )
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

CgrlnKggMjAyMy82LzUgMjI6MjgsIFdpbGwgRGVhY29uIOWGmemBkzoKPiBPbiBUaHUsIE1heSAy
NSwgMjAyMyBhdCAxMDo1NTo1M0FNICswODAwLCBTb25nIFNodWFpIHdyb3RlOgo+PiBEdXJpbmcg
aGliZXJuYXRpb24gb3IgcmVzdG9yYXRpb24sIGZyZWV6ZV9zZWNvbmRhcnlfY3B1cwo+PiBjaGVj
a3MgbnVtX29ubGluZV9jcHVzIHZpYSBCVUdfT04sIGFuZCB0aGUgc3Vic2VxdWVudAo+PiBzYXZl
X3Byb2Nlc3Nvcl9zdGF0ZSBhbHNvIGRvZXMgdGhlIGNoZWNraW5nIHdpdGggV0FSTl9PTi4KPj4K
Pj4gU28gcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBjaGVja2luZyBpbiBzYXZlX3Byb2Nlc3Nvcl9z
dGF0ZS4KPiAKPiBUaGlzIGlzIGEgdmVyeSB0ZXJzZSBzdW1tYXJ5IG9mIHdoeSB0aGlzIGlzIHNh
ZmUuCj4gCj4gTG9va2luZyBhdCB0aGUgY29kZSwgZnJlZXplX3NlY29uZGFyeV9jcHVzKCkgZG9l
cyBpbmRlZWQgY2hlY2sKPiBudW1fb25saW5lX2NwdXMoKSwgb3IgaXQgcmV0dXJucyBhbiBlcnJv
ciB3aGljaCB0aGVuIGNhdXNlcyB0aGUgaGliZXJuYXRpb24KPiB0byBmYWlsLiBIb3dldmVyLCB0
aGlzIGlzIGFsbCBpbiB0aGUgQ09ORklHX1BNX1NMRUVQX1NNUD15IGNhc2UgYW5kIGl0J3MKPiBm
YXIgbGVzcyBjbGVhciB3aGV0aGVyIHlvdXIgYXNzZXJ0aW9uIGlzIHRydWUgaWYgdGhhdCBvcHRp
b24gaXMgZGlzYWJsZWQuCj4gCj4gUGxlYXNlIGNhbiB5b3UgZGVzY3JpYmUgeW91ciByZWFzb25p
bmcgaW4gbW9yZSBkZXRhaWwsIGFuZCBjb3ZlciB0aGUgY2FzZQo+IHdoZXJlIENPTkZJR19QTV9T
TEVFUF9TTVA9biBhcyB3ZWxsLCBwbGVhc2U/CgpXaXRoIEhJQkVSTkFUSU9OIGVuYWJsZWQsIHRo
ZSBzb2xlIHBvc3NpYmxlIGNvbmRpdGlvbiB0byBkaXNhYmxlIApDT05GSUdfUE1fU0xFRVBfU01Q
CmlzICFTTVAgd2hlcmUgbnVtX29ubGluZV9jcHVzIGlzIGFsd2F5cyAxLiBXZSBhbHNvIGRvbid0
IGhhdmUgdG8gY2hlY2sgCml0IGluIHNhdmVfcHJvY2Vzc29yX3N0YXRlLgoKPiAKPiBXaWxsCj4g
CgotLSAKVGhhbmtzClNvbmcgU2h1YWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
