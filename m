Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4E6CAC5AA
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 03:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qjw1IJBW/H50qNJEEhOrSOsRcuijuHn8zuvkD/8M/PE=; b=QG9G3SXzNue9Vj
	ka+GFBgegWmPBS+HcMYtuGmOhpj5WsSwOdgkn8OfhsYgJ4wDYYZfXkRGSepjqjx/k7NvBhr4jEjCK
	+ngVvGYgRcM93HiNHAztWHe4py5UTeK+vNjbVWpF/32jtBj0/KXVFFwM2hvNFBkXW+FebGLbTL7pj
	/vQY0w5R5r1VD16gWNj4jlbbMtZQv399uzpbYVvlhAEqm0nWSPc71RHEG56o02zWyBugppjYOS+hf
	1GrSSg9BPGACcBkexGegZiDxK+ahPEClL5sPWUgQF3ez2UgT51Lkok2Z+1pVIkuLGnVQfd1+oODmc
	aiuHl7ktu2xsbdCy8CEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cz5-00000005Qbm-2Brq;
	Thu, 25 Sep 2025 03:49:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cz3-00000005QbL-0sGD
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 03:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1998443623
	for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 03:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF559C116D0
	for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 03:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758772166;
	bh=9+n9gCRnBkEBRqPerfKa2SKbf3c/Tr4Krnd5g4dgtYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qBrxAPqJ0nQFtHueFClVdveiENOasoq64jI05ghcbNm/f78YtKxOnoqOR0qMz7ve1
	 WBNL0cRTrAXL0fKytRqgvcbIk6/ghVDBlhTPRmgOYOLN2awq4HxmW8HRBSrkPpstH/
	 FBjGT9gGEPUaL/hDs5EiIQiMtzwePCHQif1uoic9o+cin/b4err73Mn1ifDcc+a5U7
	 8oO9/UVoJ9hqiBfzd+IHSAB/7QgA6ZJBjQA4jxJ6JPeKioDScsx1m0iGxoqnJQTsPR
	 2/N38yuvaQj6JVOahkOjTbgeRSRYZOfjWOI0hkWDFNuSeHXOE0S+u+dB5e2rPso869
	 Wp3aVVmpnlMpg==
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b555ed30c1cso415984a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 20:49:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRZd7sLlGGNIVMRf3RnylKosLHJYf7HBlyzRb51+XeuGVajIgadilpe6Gg+53Q158Uu9xcScSnskHueg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZvMXEI5pJvfgy+iho8sWsqfr3Kuu6nh12lN+CebbbT9lyux78
	CdgwJ8+hV2jVA9UTj+RAbpmSFds9NAhTWM7cbyZ2rUPq1/IZCzxLEFjJHKlibxDBkL4GVPs5LSD
	tpKG7z9KLmC3m6/TtYy7IFlsm+lBd3Zw=
X-Google-Smtp-Source: AGHT+IFjawzqKRaaD12Xd3YEwO0IomHNLlG/wP3oUxi1zLoggLLIyHubGHDHQmQ7+xzs0tgBDptLaifCEXhrF1ALb7E=
X-Received: by 2002:a17:902:e74b:b0:24c:caab:dfd2 with SMTP id
 d9443c01a7336-27ed4a7aef4mr22154155ad.61.1758772166433; Wed, 24 Sep 2025
 20:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech> <20250925030650.35694-1-fushan.zeng@anlogic.com>
In-Reply-To: <20250925030650.35694-1-fushan.zeng@anlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 12:49:13 +0900
X-Gmail-Original-Message-ID: <CAJKOXPfPxPf8BcXggBYUiA26zi-5bwP4Q9ksRzLEVGtu=3wwVw@mail.gmail.com>
X-Gm-Features: AS18NWDltM8WwcdqU7yGgLoPfQzb0VbbepqXzn4dgQz2wQcK24WQMpY9ZPu2LM0
Message-ID: <CAJKOXPfPxPf8BcXggBYUiA26zi-5bwP4Q9ksRzLEVGtu=3wwVw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
To: "fushan.zeng" <fushan.zeng@anlogic.com>
Cc: junhui.liu@pigmoral.tech, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, conor@kernel.org, 
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, krzk+dt@kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	palmer@dabbelt.com, palmer@sifive.com, paul.walmsley@sifive.com, 
	robh@kernel.org, samuel.holland@sifive.com, tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_204929_296848_496E72CB 
X-CRM114-Status: GOOD (  22.99  )
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

T24gVGh1LCAyNSBTZXB0IDIwMjUgYXQgMTI6MjIsIGZ1c2hhbi56ZW5nIDxmdXNoYW4uemVuZ0Bh
bmxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDIyIFNlcCAyMDI1IDIwOjQ2OjMwICswODAw
LCBKdW5odWkgTGl1IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBpbml0
aWFsIHN1cHBvcnQgZm9yIHRoZSBBbmxvZ2ljIERSMVY5MCBTb0MKPiA+IFsxXSBhbmQgdGhlIE1p
bGlhbmtlIE1MS1BBSS1GUzAxIFsyXSBib2FyZC4KPiA+Cj4gPiBUaGUgRFIxVjkwIGlzIGEgUklT
Qy1WIGJhc2VkIEZQU29DIGZyb20gQW5sb2dpYywgZmVhdHVyaW5nIGEgTnVjbGVpCj4gPiBVWDkw
MCBbM10gY29yZSBhcyBpdHMgcHJvY2Vzc2luZyBzeXN0ZW0gKFBTKSBhbmQgOTQsNDY0IExVVHMg
aW4gdGhlCj4gPiBwcm9ncmFtbWFibGUgbG9naWMgKFBMKSBwYXJ0LiBUaGUgTWlsaWFua2UgTUxL
UEFJLUZTMDEgYm9hcmQgaXMgb25lIG9mCj4gPiB0aGUgZmlyc3QgcGxhdGZvcm1zIGJhc2VkIG9u
IHRoaXMgU29DLCB3aXRoIFVBUlQxIHJvdXRlZCB0byBhIFR5cGUtQwo+ID4gaW50ZXJmYWNlIGZv
ciBjb25zb2xlIGFjY2Vzcy4KPiA+Cj4gPiBUZXN0ZWQgb24gdGhlIE1pbGlhbmtlIE1MS1BBSS1G
UzAxIGJvYXJkIHdpdGggYm90aCB0aGUgdmVuZG9yJ3MgT3BlblNCSQo+ID4gYW5kIHRoZSBub3Qt
eWV0LXVwc3RyZWFtZWQgbWFpbmxpbmUgT3BlblNCSSBbNF0sIGFzIHdlbGwgYXMgdGhlIHZlbmRv
cuKAmXMKPiA+IFUtQm9vdC4gQmVjYXVzZSB0aGUgdmVuZG9y4oCZcyBPcGVuU0JJIGlzIGxvYWRl
ZCBhdCAweDFmMzAwMDAwLCB3ZSBoYXZlCj4gPiB0byBhZGRpdGlvbmFsbHkgcmVzZXJ2ZSB0aGUg
RFJBTSByZWdpb24gMHgxZmUwMDAwMOKAkzB4MWZmZmZmZmYgdG8gcHJldmVudAo+ID4gb3Zlcmxh
cCBpZiB1c2luZyB2ZW5kb3IncyBPcGVuU0JJLgo+ID4KPiA+IE5vdGljZTogQSAibm80bHZsIiBi
b290YXJnIG9yIGRlcGVuZGVuY3kgcGF0Y2ggWzVdIGlzIGN1cnJlbnRseSByZXF1aXJlZAo+ID4g
Zm9yIHN1Y2Nlc3NmdWwgYm9vdCBvbiB0aGUgRFIxVjkwIHBsYXRmb3JtLCBzaW5jZSB0aGUgU29D
IGhhbmdzIGlmIHRoZQo+ID4ga2VybmVsIGF0dGVtcHRzIHRvIHVzZSB1bnN1cHBvcnRlZCA0LWxl
dmVsIG9yIDUtbGV2ZWwgcGFnaW5nIG1vZGVzLgo+Cj4gVGhhbmtzIGZpcnN0Lgo+IEFubG9pZ2Mg
YWxyZWFkeSBoYXMgdGhlIG9wZW4gc291cmNlIFNESyBhdCBodHRwczovL2dpdGVlLmNvbS9hbmxv
Z2ljL3NkaywKPiBhbmQgd2lsbCBzdWJtaXQgaXQgdG8gbWFpbmxpbmUgYXQgc3VpdGFibGUgdGlt
ZS4KPiBJdCBpcyBiZXR0ZXIgdGhhdCBhbmxvZ2ljIFNPQ3MgYXJlIGxvbmcgdGVybSBtYWludGFp
bmVkIGFuZCBzdXBwb3J0ZWQKPiBieSBBbmxvZ2ljIG9mZmljaWFsbHkgaW4gbWFpbmxpbmUgYW5k
IGZvciBjdXN0b21lcnMuCj4gVGhlIGNvZGUgc2hvdWxkIGJlIGEgZnVsbCBmZWF0dXJlIHZlcnNp
b24gYWZ0ZXIgbG90cyBvZiB0ZXN0cywgbm90IHRoZQo+IG1vZGlmaWVkIGFuZCBzaW1wbGlmaWVk
IHZlcnNpb24gZnJvbSBBbmxvZ2ljIG9wZW4gc291cmNlLgo+IEFuZCB3ZSBob3BlIHRoYXQgdGhl
cmUgd29uJ3QgYmUgdHdvIGRpZmZlcmVudCB2ZXJzaW9ucyBjb2RlIG9mIGFubG9naWMgU09DcywK
PiBpdCBtYXkgY29uZnVzZSBjdXN0b21lcnMuCgoKU29ycnksIGJ1dCB5b3UgZG9uJ3QgZ2V0IHRv
IGNvbnRyb2wgaG93IG9wZW4gc291cmNlIGFuZCB1cHN0cmVhbQp3b3Jrcy4gQ29tbXVuaXR5IHdp
bGwgbm90IHdhaXQgZm9yIHlvdXIgInN1aXRhYmxlIHRpbWUiLiBUaGVyZSB3aWxsIGJlCm9ubHkg
b25lIHVwc3RyZWFtIHN1cHBvcnQsIHNvIHBsZWFzZSBzdGFydCBoZWxwaW5nIGhlcmUgYnkgcmV2
aWV3aW5nLAppbnN0ZWFkIG9mIGNyZWF0aW5nIG9ic3RhY2xlcyBhbmQgdHJ5aW5nIHRvIHN0b3Ag
Y29tbXVuaXR5IGZyb20Kd29ya2luZyBvbiB0aGlzLgoKVGhlcmUgd2FzIHJlY2VudGx5IGEgY29t
cGFueSB0cnlpbmcgdG8gImNvbnRyb2wiIHVwc3RyZWFtaW5nIHByb2Nlc3MKb2YgdGhlaXIgbGFw
dG9wcyBhbmQgaXQgZW5kZWQgd2l0aCBiaWcgcHVibGljIG1lc3MuIFBsZWFzZSBsZWFybiBmcm9t
CnRoZWlyIG1pc3Rha2VzLgoKQlIsCksKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
