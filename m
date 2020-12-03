Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4489EC4361A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 19:13:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA849221E7
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 19:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA849221E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ymegM78VEv/UiKeTLm09S4OjFA4qreOsT+EI4uUjKSk=; b=E0Os9hH1TiKfkvWBsQRZfZZHg
	TBWYAakRnw6WjTl2iiAwIDTpqUlz/ZAoW97oIIC7l+88oQCe1N37gSF4/XJaBL1pV5BbU27fcHdvj
	qbP/b4lq7JjN8IEDhC0Bq1LF22pbWt44WOikEWKiwJrmK9epOLc5lIPbcN/1lPy39nC9P1+2htiv/
	Ij8WYxZLVr2BoMFlsEaVANwiH3GNsfZGe1chyOi2F4lwubyBEuT77iHwBf/DnHga9nYu7iTVZfnRQ
	pBbjcst7s+jqHyXbnvpO8XYzOQAfc125TSjqPkqhXFuz0U48sKGoNqY/JKZctdG1WifAaC7mahSor
	Y/pn2LkzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kku2L-0000Sc-BH; Thu, 03 Dec 2020 19:13:05 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kku2J-0000SI-2P
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 19:13:04 +0000
Received: from [192.168.1.155] ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MqatK-1kOzP81VTs-00mX8d; Thu, 03 Dec 2020 20:12:58 +0100
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201127183003.2849-1-info@metux.net>
 <20201129221050.GH456020@latitude>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <648f227d-d5b3-7d5a-6963-5154a81472d1@metux.net>
Date: Thu, 3 Dec 2020 20:12:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201129221050.GH456020@latitude>
Content-Language: tl
X-Provags-ID: V03:K1:oSAV2CyH8BEIRzztYAjpVPgPm2x8+LNxxkFhOf0No0nP62y+Fqe
 KC4iac655B8FVOgVPITpfK6sfVqDgZ2OFvEyo3g19vt0mZ8J4qJeMljIP8D3B2ZDB3WZFfS
 PdBl/MNRoYWTHsR24radOq4NH+BJEH9KQ+rqguNFSKP90FO91WYDxMjJQAZkud6s0X+F+QW
 u7KwO84uwaGY25dmKg5GQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LWGEsYsH1+4=:PWZ/523Xcpz9nTSmhc4QSm
 0tHWaSWwK9sPyHHGGAqlAImplar628g9x1f2MjNIx/zjV/LACgSeloPiqwDRluhPPHpG0gPLu
 jNwAS1gqPQYgMrnD3YdgHBpJ+GLn4uws1YJzlVjeWxaE+MNmzHYKTtCimfDBgpjGdyxsQmU3n
 eGgCpdgbuD5i49UXAbI+i/PrEMLxJgXXfIr9o1LhOUVQcxr3IKSwYid2OTB843p2VZ8rgxzN2
 QfzXVnyXrChrOhshdBimzhcTU6Wg1qP3ughX6deWQNjyTBOpzne2S5kc/61BZgXo30GILGSXW
 vGPdqtLyBvpgOQM2MzFpm8eA7plxeMordIf/5beUeoT6Nu7TBjZWEYk5hDWCgIOAtwWeaC58A
 OIrLceY4UoK1VTJOG0DKhApBtvlA6S4/jz8yDPxLvDB0haUHvpM6sNYYEUiB1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_141303_579186_99A46005 
X-CRM114-Status: GOOD (  12.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: bgolaszewski@baylibre.com, linus.walleij@linaro.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 jasowang@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjkuMTEuMjAgMjM6MTAsIEpvbmF0aGFuIE5ldXNjaMOkZmVyIHdyb3RlOgo+IEhpLAo+Cj4g
T24gRnJpLCBOb3YgMjcsIDIwMjAgYXQgMDc6MzA6MDNQTSArMDEwMCwgRW5yaWNvIFdlaWdlbHQs
IG1ldHV4IElUCmNvbnN1bHQgd3JvdGU6Cj4+IEludHJvZHVjaW5nIG5ldyBncGlvIGRyaXZlciBm
b3IgdmlydHVhbCBHUElPIGRldmljZXMgdmlhIHZpcnRpby4KPj4KPj4gVGhlIGRyaXZlciBhbGxv
d3Mgcm91dGluZyBncGlvIGNvbnRyb2wgaW50byBWTSBndWVzdHMsIGVnLiBicmlnZGluZwo+PiB2
aXJ0dWFsIGdwaW9zIHRvIHNwZWNpZmljIGhvc3QgZ3Bpb3MsIG9yIGF0dGFjaGluZyBzaW11bGF0
b3JzIGZvcgo+PiBhdXRvbWF0aWMgYXBwbGljYXRpb24gdGVzdGluZy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQgPGluZm9AbWV0dXgubmV0Pgo+
Cj4gaXMgdGhlcmUgYSBzcGVjIG9mIHRoZSB2aXJ0aW8tZ3BpbyBwcm90b2NvbCBhdmFpbGFibGU/
IElmIHNvLCBsaW5raW5nIGl0Cj4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZC9vciBkcml2ZXIv
S2NvbmZpZyB3b3VsZCBiZSBuaWNlLgoKCmFkZGVkIGl0IHRvIERvY3VtZW50YXRpb24vZ3Bpby8g
aW4gcGF0Y2ggdmVyc2lvbiAyLgoKLS1tdHgKCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBKb25hdGhh
biBOZXVzY2jDpGZlcgo+Ci0tIAotLS0KSGlud2VpczogdW52ZXJzY2hsw7xzc2VsdGUgRS1NYWls
cyBrw7ZubmVuIGxlaWNodCBhYmdlaMO2cnQgdW5kIG1hbmlwdWxpZXJ0CndlcmRlbiAhIEbDvHIg
ZWluZSB2ZXJ0cmF1bGljaGUgS29tbXVuaWthdGlvbiBzZW5kZW4gU2llIGJpdHRlIGlocmVuCkdQ
Ry9QR1AtU2NobMO8c3NlbCB6dS4KLS0tCkVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0
CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5nCmluZm9AbWV0dXgu
bmV0IC0tICs0OS0xNTEtMjc1NjUyODcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
