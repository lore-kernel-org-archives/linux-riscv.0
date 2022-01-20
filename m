Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4A8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=q/VyTaNz1uomRSlzT9ZIIEvZKiu6RzCW/3hhpVtzhnc=; b=El2d+Xc3EB6SjutT8BlW8IBDb/
	8FEQzS+4B6r6e/XUTGgHSyJxX764Eg7MIk2k91TnVuihkPRMUF5pU+Pcy2lheIkMIm2+eeC8xaS9x
	WOLaGTH+303ViNHD5F6zVPa7jaY0HVTcs+GqaQHCGf694t0d5w+w4h4uqDbPKeJ/oRp/jYzCsQRa8
	lglkSaC/uVOC3LkS5AQo2MdHCifLRVZ5Vqg52rvNFugoDv3quCI/TO0tpGgSvibvXZs5pCA9uF1gK
	t3bhx9vPu4pbdSAxC0LZoZsFEF3EG3Lg3eXVcaw5oYI+yeFugXD2TrQ0Xabcx/AYeh8gad2ZNOSW3
	73O7i2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAc03-00Cl0w-G4; Thu, 20 Jan 2022 18:17:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAbzz-00Ckz5-Di
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:17:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d5so4266499pjk.5
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uC24dwBDFYlPwZIYL2HsVi2/C5I01RLnxTMvvJMu+BQ=;
 b=lY5AG79+OamxRdgX54aP/AbsEAj4jjC05Li4bJX637zqF/+EVSHrNBzbeJwatK4jLy
 f22WQiH1toeAILYl6sTtTM6NFAp3jRQDpVAHxxQA98wKEZcULLjKNxnESY33dCFVZmXd
 IGdJKzKmPqGYOn6XlC1xn3NorC4uPMh/6cmhOCFbBzDu+17bl8OmiU1uTgkZnxp26LqT
 B+oF02kGj7CmDyYEmZfUcMK6aV1//4tU/5bHLpQLfZTcp8xwRZD+BXrLoem3r6WJRP5M
 JC03L09Hm4LN4ua6WFQdHRj7a0bFuBTv4h4YucZDNPs+j25ahc3zQLKdMvl8dRMUm31/
 XkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uC24dwBDFYlPwZIYL2HsVi2/C5I01RLnxTMvvJMu+BQ=;
 b=ZUWoRwwle4wmhXxknAQYE21nj/+wAv2dTltTuXZQDYoY1/Z5I6bIbKlQMdMpeLFB8i
 ImmDkQOEAWwRhC8VuYanrBqKfwy2pmGPKl0fK83XuZsjO/xK3jIdtf0j6RBe4oICGJFX
 alAR8MXjzJw456ve+QwbFqlIvlm+ArQjIOQIR5lyik1y+C94489zFQY8Zp2CYVL/ks3H
 NRxLqt1jvTTiapWT0tbm4qtgbmVVzU7r9Hf9vN98nJ/dCBmQ13I1szBQLSyUclmV0lEm
 Wrxvcy2zKfOBPCB8TqtuE9EPaSK3rwCJJ4W0x22WFSidgsstp64vteVkJJB/hWFK3AWP
 dmCg==
X-Gm-Message-State: AOAM530ZJqsDOfCcraJYJ1Zl5Wxi7TSeQFBErxs0Vscxud/uNh37nfdF
 +MCQC4qEMCKhdxGniudUuncNYQ==
X-Google-Smtp-Source: ABdhPJziNRpPC3KLwKGQytXhOnjNqmYk6QLfSsTVaekBbezJEDJk6aCEWnW9OX1QP+GwuVrq/1BX/Q==
X-Received: by 2002:a17:902:ed85:b0:14a:2471:e11d with SMTP id
 e5-20020a170902ed8500b0014a2471e11dmr39168021plj.77.1642702646769; 
 Thu, 20 Jan 2022 10:17:26 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id c35sm3064385pgl.6.2022.01.20.10.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:17:26 -0800 (PST)
Date: Thu, 20 Jan 2022 10:17:26 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:15:39 PST (-0800)
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Add gpio poweroff
In-Reply-To: <ED7B7FCA-182C-45AC-90E7-17559762DE0B@jrtc27.com>
CC: dimitri.ledkov@canonical.com, w6rz@comcast.net, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 plr.vincent@gmail.com, 
 krzysztof.kozlowski@canonical.com, qiuwenbo@kylinos.com.cn,
 yash.shah@sifive.com, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jrtc27@jrtc27.com
Message-ID: <mhng-21187529-2437-47dd-9506-9d877123b539@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_101727_501693_9E1E7912 
X-CRM114-Status: GOOD (  26.20  )
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

T24gRnJpLCAzMSBEZWMgMjAyMSAwOToxNjowMCBQU1QgKC0wODAwKSwganJ0YzI3QGpydGMyNy5j
b20gd3JvdGU6Cj4gT24gMzEgRGVjIDIwMjEsIGF0IDE2OjQ5LCBEaW1pdHJpIEpvaG4gTGVka292
IDxkaW1pdHJpLmxlZGtvdkBjYW5vbmljYWwuY29tPiB3cm90ZToKPj4gCj4+IEhvd2V2ZXIsIGlu
IHNvbWUgY29uZmlndXJhdGlvbnMgdWJvb3QgbG9hZHMga2VybmVsIHByb3ZpZGVkIGR0YiwgdGhl
biB0aGlzIHBpbiBuZWVkcyB0byBiZSBkZWZpbmVzIGZvciBTQkkgdG8gcHJvdmlkZSBwb3dlcm9m
ZiB2aWEgdGhpcyBwaW4uCj4+IAo+PiBLZXJuZWwsIHVib290LCBvcGVuc2JpIGR0YnMgZm9yIHVu
bWF0Y2hlZCBtdXN0IGJlIGNvbnNpc3RlbnQgd2l0aCBlYWNoIG90aGVyIGFuZCBhbGwgc2hvdWxk
IGRlZmluZSBwb3dlcm9mZiBwaW4uCj4KPiBVLUJvb3QgU1BMIGxvYWRzIGl0cyBlbWJlZGRlZCBE
VEIgZm9yIE9wZW5TQknigJlzIHVzZS4gVS1Cb290IOKAnHByb3BlcuKAnQo+IGxvYWRzIHRoZSBr
ZXJuZWzigJlzIERUQiBmb3IgdGhlIGtlcm5lbOKAmXMgdXNlLiBUaGUgRFRCIGxvYWRlZCBmb3Ig
dGhlCj4ga2VybmVsIGlzIG5ldmVyIGZlZCBiYWNrIHNvbWVob3cuIEp1c3QgYXMgd2UgZG9u4oCZ
dCBwcm92aWRlIEREUiB0aW1pbmcKPiBpbmZvcm1hdGlvbiBpbiB0aGUga2VybmVsIERUQiwgb25s
eSBVLUJvb3TigJlzLCB0aGVyZSBzaG91bGQgYmUgbm8gbmVlZAo+IHRvIHByb3ZpZGUgaW5mb3Jt
YXRpb24gYWJvdXQgdGhpcyBHUElPIHRvIHRoZSBrZXJuZWwuIEVpdGhlciB0aGUga2VybmVsCj4g
d2lsbCBwcmlvcml0aXNlIFNCSSBwb3dlci1vZmYsIHdoaWNoIHJlbmRlcnMgdGhlIERUQiBub2Rl
IGEgY29tcGxldGUKPiB3YXN0ZSBvZiBzcGFjZSwgYW5kIHBvc3NpYmx5IGNvbmZ1c2luZyB0byBl
eGlzdCwgb3IgdGhlIGtlcm5lbCB3aWxsCj4gcHJpb3JpdGlzZSBHUElPIHBvd2VyLW9mZiwgd2hp
Y2ggc2hvdWxkIGJlIGRpc2NvdXJhZ2VkIGFzIHlvdeKAmXJlCj4gc3VwcG9zZWQgdG8gdXNlIHN0
YW5kYXJkaXNlZCBmaXJtd2FyZSBpbnRlcmZhY2VzIGZvciB0aGVzZSBraW5kcyBvZgo+IHBsYXRm
b3JtLXNwZWNpZmljIHRoaW5ncy4KClRoZSBEVHMgKGFuZCBiaW5kaW5ncywgZXRjKSBpbiB0aGUg
a2VybmVsIHNvdXJjZSB0cmVlIGFyZSBtZWFudCBmb3IgbW9yZSAKdGhhbiBqdXN0IHRoZSBrZXJu
ZWwncyBjb25zdW1wdGlvbi4gIEkga25vdyB3ZSBoYXZlIChhbmQgd2lsbCBsaWtlbHkgCmFsd2F5
cyBoYXZlKSBzb21lIGRpZmYgd2l0aCB0aGUgb3RoZXIgY29uc3VtZXJzIG9mIGRldmljZSB0cmVl
cywgYnV0IHdlIApjYW4gYXQgbGVhc3QgdHJ5IHRvIGdldCBmb2xrcyBvbiB0aGUgc2FtZSBwYWdl
IGFib3V0IHNtYWxsIHN0dWZmIGxpa2UgCnRoaXMuCgpUaGVyZSBpcyBhbHNvIHNvbWUgdXRpbGl0
eSB0byBoYXZpbmcgdGhpcyB2aXNpYmxlIHRvIExpbnV4OiBhdCBhIGJhcmUgCm1pbmltdW0gaXQg
bGV0cyB1cyBrbm93IHRoYXQgR1BJTyBwaW4gaGFzIGFuIGltcG9ydGFudCBmdW5jdGlvbi4KClRo
aXMgcGF0Y2ggaXMgb24gZm9yLW5leHQuCgo+Cj4gSmVzcwo+Cj4+IE9uIEZyaSwgMzEgRGVjIDIw
MjEsIDA2OjU4IEphbWVzIENsYXJrZSwgPGpydGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPj4gT24g
MzEgRGVjIDIwMjEsIGF0IDA2OjExLCBSb24gRWNvbm9tb3MgPHc2cnpAY29tY2FzdC5uZXQ+IHdy
b3RlOgo+PiA+IAo+PiA+IFRoaXMgcGF0Y2ggaXMgcmVxdWlyZWQgZm9yIHRoZSBmb2xsb3dpbmcg
Y29tbWl0IHRvIHdvcmsuCj4+ID4gCj4+ID4gY29tbWl0IGYyOTI4ZTIyNGQ4NSAoInJpc2N2OiBz
ZXQgZGVmYXVsdCBwbV9wb3dlcl9vZmYgdG8gTlVMTCIpCj4+ID4gCj4+ID4gU2lnbmVkLW9mZi1i
eTogUm9uIEVjb25vbW9zIDx3NnJ6QGNvbWNhc3QubmV0Pgo+PiA+IC0tLQo+PiA+IGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDUgKysrKysKPj4g
PiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+ID4gCj4+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cwo+PiA+IGlu
ZGV4IDZiZmExZjI0ZDNkZS4uYzRlZDllZmRmZjAzIDEwMDY0NAo+PiA+IC0tLSBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cwo+PiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cwo+PiA+IEBA
IC0zOSw2ICszOSwxMSBAQCBydGNjbGs6IHJ0Y2NsayB7Cj4+ID4gICAgICAgIGNsb2NrLWZyZXF1
ZW5jeSA9IDxSVENDTEtfRlJFUT47Cj4+ID4gICAgICAgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJy
dGNjbGsiOwo+PiA+ICAgIH07Cj4+ID4gKwo+PiA+ICsgICAgZ3Bpby1wb3dlcm9mZiB7Cj4+ID4g
KyAgICAgICAgY29tcGF0aWJsZSA9ICJncGlvLXBvd2Vyb2ZmIjsKPj4gPiArICAgICAgICBncGlv
cyA9IDwmZ3BpbyAyIEdQSU9fQUNUSVZFX0xPVz47Cj4+ID4gKyAgICB9Owo+PiAKPj4gV2h5PyBJ
dOKAmXMgYWJzdHJhY3RlZCBieSBmaXJtd2FyZSwgd2hpY2ggd29ya3MuCj4+IAo+PiBKZXNzCj4+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
