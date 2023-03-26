Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C83C6FD1C
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Mar 2023 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eq5ECBQqOP7yCCToaP2X/KsP+8+k/7Og4SaulbuJP/w=; b=l8MC9aZYsGFACh
	8epWjaEXXfXODFNjkc2RyuGL8qmzRIoeDoG7P2udH/m9NPpWY8TODRBzJM1Z8rGlVyNE96kP1bMCW
	EUU155b9xhYXAXU2BvEOc5WN2LS43453bocCuCMsoDoo5S+800eZT4wanCKil/679RvpzzrDH0QDW
	Ox8HFc6dnCBowBUDq552/QTuLj6xx4Rb8T/qCrSubTKW3FWUxx+kpAbYkaluCD4Tw5ejlnTE2l1x4
	2wAcVhSPxkWVurRtJBfA1RsuFXIiPitrI6uUyx3dJpvKkLymZR1yA5Hzx7T+1Quq6ZKSHV0UYFd2c
	N3qGKuQuI0ytIqZ0Qqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgTKW-008pK5-2B;
	Sun, 26 Mar 2023 16:34:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgTKT-008pJd-0a
	for linux-riscv@lists.infradead.org;
	Sun, 26 Mar 2023 16:34:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0812C60EFE
	for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 16:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA8DC433A4
	for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679848486;
	bh=lniLhjzAVP4A7/HZzVY4+OrTbNpVJm/gYIDl+oQterE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JK3Yveqek/OJHInqxbDUOO4UWY67DeXaOjY5IknYOWk+oxY5lR1xHuR77gsb143FU
	 kvRAzHEad2ehIHdRTM/RHydR6QCWR+uuhY2J1gbT/HI6YtlqiOtUG61VBQaQ/b+xyZ
	 rwVEB5LxxQmV/hMzeKVGhmu/o9OQwsJx++9XdX8Cvp968Tr73FxM0epsJ+ujdcAI61
	 sC1IH1WNzp3+89nKTG1XA2dkn899Qjt5NeBSq8LSIpbRRiRYTCMY830+VCSPdL3GEb
	 0Kwt03VBvIyqBKN0pjk4satvfryw7CSOwgFwMqsRaIqI9J08PZ3ev/1ZxRwvSSUhu4
	 dFX7zy5UTOvAQ==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-17aaa51a911so6920699fac.5
        for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 09:34:46 -0700 (PDT)
X-Gm-Message-State: AO0yUKUSXH5dIGJIxHd7WC+A+PJODYx7NUYoQ5zMVHGD61t0//xYz9/8
	N7rvM3HgpPxKuqjED+sCgzk6uTJPjD32qVtqO/A=
X-Google-Smtp-Source: AKy350ZKevNh0OIe4jwck411MTacKfhxDKD4eEX6xDTuM7GhMe3UsweBg/WHTc/a+KMwbk0nCqKHqiBgIpefvnGdVjA=
X-Received: by 2002:a05:6870:a2a:b0:177:aff1:a393 with SMTP id
 bf42-20020a0568700a2a00b00177aff1a393mr2203464oac.11.1679848485974; Sun, 26
 Mar 2023 09:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230326153412.63128-1-hi@alyssa.is>
In-Reply-To: <20230326153412.63128-1-hi@alyssa.is>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 27 Mar 2023 01:34:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyn3R3BRxJ0Wdd_djTNQQR3Qh56jXAhR+gzgTsPY7Xew@mail.gmail.com>
Message-ID: <CAK7LNARyn3R3BRxJ0Wdd_djTNQQR3Qh56jXAhR+gzgTsPY7Xew@mail.gmail.com>
Subject: Re: [PATCH] purgatory: fix disabling debug info
To: Alyssa Ross <hi@alyssa.is>
Cc: Nick Cao <nickcao@nichi.co>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Tom Rix <trix@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_093449_320293_67F2C24F 
X-CRM114-Status: GOOD (  16.34  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMTI6MzXigK9BTSBBbHlzc2EgUm9zcyA8aGlAYWx5c3Nh
LmlzPiB3cm90ZToKPgo+IFNpbmNlIDMyZWY5ZTUwNTRlYywgLVdhLC1nZHdhcmYtMiBpcyBubyBs
b25nZXIgdXNlZCBpbiBLQlVJTERfQUZMQUdTLgo+IEluc3RlYWQsIGl0IGluY2x1ZGVzIC1nLCB0
aGUgYXBwcm9wcmlhdGUgLWdkd2FyZi0qIGZsYWcsIGFuZCBhbHNvIHRoZQo+IC1XYSB2ZXJzaW9u
cyBvZiBib3RoIG9mIHRob3NlIGlmIGJ1aWxkaW5nIHdpdGggQ2xhbmcgYW5kIEdOVSBhcy4gIEFz
IGEKPiByZXN1bHQsIGRlYnVnIGluZm8gd2FzIGJlaW5nIGdlbmVyYXRlZCBmb3IgdGhlIHB1cmdh
dG9yeSBvYmplY3RzLCBldmVuCj4gdGhvdWdoIHRoZSBpbnRlbnRpb24gd2FzIHRoYXQgaXQgbm90
IGJlLgo+Cj4gRml4ZXM6IDMyZWY5ZTUwNTRlYyAoIk1ha2VmaWxlLmRlYnVnOiByZS1lbmFibGUg
ZGVidWcgaW5mbyBmb3IgLlMgZmlsZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEFseXNzYSBSb3NzIDxo
aUBhbHlzc2EuaXM+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgYXJjaC9y
aXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUgfCAxMiArKysrKystLS0tLS0KPiAgYXJjaC94ODYvcHVy
Z2F0b3J5L01ha2VmaWxlICAgfCAgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvcHVyZ2F0
b3J5L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUKPiBpbmRleCBkMTZi
ZjcxNWE1ODYuLjk3MDAxNzk4ZmExOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L3B1cmdhdG9y
eS9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L01ha2VmaWxlCj4gQEAgLTg0
LDEyICs4NCwxMiBAQCBDRkxBR1Nfc3RyaW5nLm8gICAgICAgICAgICAgICAgICAgICArPSAkKFBV
UkdBVE9SWV9DRkxBR1MpCj4gIENGTEFHU19SRU1PVkVfY3R5cGUubyAgICAgICAgICArPSAkKFBV
UkdBVE9SWV9DRkxBR1NfUkVNT1ZFKQo+ICBDRkxBR1NfY3R5cGUubyAgICAgICAgICAgICAgICAg
Kz0gJChQVVJHQVRPUllfQ0ZMQUdTKQo+Cj4gLUFGTEFHU19SRU1PVkVfZW50cnkubyAgICAgICAg
ICArPSAtV2EsLWdkd2FyZi0yCj4gLUFGTEFHU19SRU1PVkVfbWVtY3B5Lm8gICAgICAgICArPSAt
V2EsLWdkd2FyZi0yCj4gLUFGTEFHU19SRU1PVkVfbWVtc2V0Lm8gICAgICAgICArPSAtV2EsLWdk
d2FyZi0yCj4gLUFGTEFHU19SRU1PVkVfc3RyY21wLm8gICAgICAgICArPSAtV2EsLWdkd2FyZi0y
Cj4gLUFGTEFHU19SRU1PVkVfc3RybGVuLm8gICAgICAgICArPSAtV2EsLWdkd2FyZi0yCj4gLUFG
TEFHU19SRU1PVkVfc3RybmNtcC5vICAgICAgICAgICAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiAr
QUZMQUdTX1JFTU9WRV9lbnRyeS5vICAgICAgICAgICs9IC1nIC1nZHdhcmYtNCAtZ2R3YXJmLTUg
LVdhLC1nIC1XYSwtZ2R3YXJmNCAtV2EsLWdkd2FyZi01Cj4gK0FGTEFHU19SRU1PVkVfbWVtY3B5
Lm8gICAgICAgICArPSAtZyAtZ2R3YXJmLTQgLWdkd2FyZi01IC1XYSwtZyAtV2EsLWdkd2FyZjQg
LVdhLC1nZHdhcmYtNQo+ICtBRkxBR1NfUkVNT1ZFX21lbXNldC5vICAgICAgICAgKz0gLWcgLWdk
d2FyZi00IC1nZHdhcmYtNSAtV2EsLWcgLVdhLC1nZHdhcmY0IC1XYSwtZ2R3YXJmLTUKPiArQUZM
QUdTX1JFTU9WRV9zdHJjbXAubyAgICAgICAgICs9IC1nIC1nZHdhcmYtNCAtZ2R3YXJmLTUgLVdh
LC1nIC1XYSwtZ2R3YXJmNCAtV2EsLWdkd2FyZi01Cj4gK0FGTEFHU19SRU1PVkVfc3RybGVuLm8g
ICAgICAgICArPSAtZyAtZ2R3YXJmLTQgLWdkd2FyZi01IC1XYSwtZyAtV2EsLWdkd2FyZjQgLVdh
LC1nZHdhcmYtNQo+ICtBRkxBR1NfUkVNT1ZFX3N0cm5jbXAubyAgICAgICAgICAgICAgICArPSAt
ZyAtZ2R3YXJmLTQgLWdkd2FyZi01IC1XYSwtZyAtV2EsLWdkd2FyZjQgLVdhLC1nZHdhcmYtNQoK
CllvdSBjYW4gbWVyZ2UgdGhlc2UgaW50byBhIHNpbmdsZSBsaW5lOgoKIGFzZmxhZ3MtcmVtb3Zl
LXkgKz0gLWcgLWdkd2FyZi00IC1nZHdhcmYtNSAtV2EsLWcgLVdhLC1nZHdhcmY0IC1XYSwtZ2R3
YXJmLTUKCgpPciwgYSBzbGlnaHRseSBzaG9ydGVyIGJ1dCB0cmlja3kgd2F5IGlzOgoKIGFzZmxh
Z3MtcmVtb3ZlLXkgKz0gJChmb3JlYWNoIHgsIC1nIC1nZHdhcmYtNCAtZ2R3YXJmLTUsICQoeCkg
LVdhLCQoeCkpCgoKPiAgJChvYmopL3B1cmdhdG9yeS5ybzogJChQVVJHQVRPUllfT0JKUykgRk9S
Q0UKPiAgICAgICAgICAgICAgICAgJChjYWxsIGlmX2NoYW5nZWQsbGQpCj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmlsZSBiL2FyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmls
ZQo+IGluZGV4IDE3ZjA5ZGMyNjM4MS4uZjFiMWVmNmM0Y2JmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
eDg2L3B1cmdhdG9yeS9NYWtlZmlsZQo+ICsrKyBiL2FyY2gveDg2L3B1cmdhdG9yeS9NYWtlZmls
ZQo+IEBAIC02OSw4ICs2OSw4IEBAIENGTEFHU19zaGEyNTYubyAgICAgICAgICAgICAgICAgICAg
ICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTKQo+ICBDRkxBR1NfUkVNT1ZFX3N0cmluZy5vICAgICAg
ICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTX1JFTU9WRSkKPiAgQ0ZMQUdTX3N0cmluZy5vICAgICAg
ICAgICAgICAgICAgICAgICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTKQo+Cj4gLUFGTEFHU19SRU1P
VkVfc2V0dXAteDg2XyQoQklUUykubyAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiAtQUZMQUdTX1JF
TU9WRV9lbnRyeTY0Lm8gICAgICAgICAgICAgICAgICAgICAgICArPSAtV2EsLWdkd2FyZi0yCj4g
K0FGTEFHU19SRU1PVkVfc2V0dXAteDg2XyQoQklUUykubyAgICAgICs9IC1nIC1nZHdhcmYtNCAt
Z2R3YXJmLTUgLVdhLC1nIC1XYSwtZ2R3YXJmNCAtV2EsLWdkd2FyZi01Cj4gK0FGTEFHU19SRU1P
VkVfZW50cnk2NC5vICAgICAgICAgICAgICAgICAgICAgICAgKz0gLWcgLWdkd2FyZi00IC1nZHdh
cmYtNSAtV2EsLWcgLVdhLC1nZHdhcmY0IC1XYSwtZ2R3YXJmLTUKCgpEaXR0by4KCgpUaGFua3Mu
CgoKCj4gICQob2JqKS9wdXJnYXRvcnkucm86ICQoUFVSR0FUT1JZX09CSlMpIEZPUkNFCj4gICAg
ICAgICAgICAgICAgICQoY2FsbCBpZl9jaGFuZ2VkLGxkKQo+Cj4gYmFzZS1jb21taXQ6IGRhOGU3
ZGExMWU0YmE3NThjYWY0YzE0OWNjOGQ4Y2Q1NTVhZWZlNWYKPiAtLQo+IDIuMzcuMQo+CgoKLS0g
CkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
