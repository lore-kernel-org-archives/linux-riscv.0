Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2A5C2A072
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 04:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi6jwyNCVjT1cRls/zXrEGNqT79oXEiJHJMpzKIsjHA=; b=A4+Z92o7i5FWuQ
	2G9vYsSeG1bMZWhLm6yUNrXhRNfWxD/vJqRjcvjexZ9vRxCBuPzIqBjeGTkoT1EVoIepUeFoDh9Rg
	MPG7pMlrZ60pzJdEhq2I968lLEJxGRYYX703CXsX69PFq1diVDZhhmtVzvhsnUCa8NtSR6+XATOxh
	V+DX8X4Mvcox//84pB3FJsCrVJBR8fZeLRgVj6PY3AnVdX3fZVyiafTgVu+ZCF7iZbNsTT6HsJp2i
	as8D2sSpYzdwgufHy9r+WiNvZr/HzI5pmwzUccGj1I/IeMk+rfK3Tv2L87UvgTnootpL7zRUy7fHg
	MQ/2cJ1+OgAClARnjP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFl-0000000AhLM-3mGL;
	Mon, 05 Jan 2026 04:31:37 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFi-0000000AhKj-4Arv
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 04:31:37 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-3ec6c10a295so5404089fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 20:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767587493; x=1768192293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXRh45S0E1wg+SbwJvRj0sTfGM+6MbGGitqWTepWxqA=;
        b=P6nmyTu7eJOQmLFmBQRqiBm758mSFDV0LoYy0+erKMgzXrkNtdpyh4w2xAnaDvji0S
         Fh4BC8UZDlF7OhVBEJpcfB20Fc0YtRo0S5BlQzANefUrkVaYc/7A+CnxNzujwfZzhMgF
         iGiUOf43mcC2oGRpOkECRl0llxoh6Egm4HoTj9o4hFOWK5INaVOS7QjOu5xlFOADrk/S
         VjUF5yudf8RKqhO5LA8Irikaj7Y2DwdomJzhsXYGeQVX1hr1iN6nHyQUvR0mz1zx9ErQ
         2t0HPS7QGzsBZw+Fg5r40582Ka0AQ5dRCZZ+cly7chBantwyMwtWalacZy3/mq7JvoaB
         SaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767587493; x=1768192293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZXRh45S0E1wg+SbwJvRj0sTfGM+6MbGGitqWTepWxqA=;
        b=J1Mwj2/AXm1StByEdwNwFOLtLUFNTLtmjywnG2rIVL5oaAdTRc2Lm2M9lmh6xnC9FR
         /Fi9NjWqm+I26xbILzh4UAssFhvmIlBhfrX/aETSIb4PzxtJYrxYyWn7wPf+Sue2H/jd
         wFUS5RDP7ZpUAnm9ckQTYQM0NVZI2vUHqyi5r99CNesdSu8GXxp9N3xHG6I3I5yn1MW6
         PcSEXwnG0iW3JnWDCFQgvpSPO0xbwTkHMkzA/ZGAbrtP+KE1q7w+Pv0wj+MTgozlpcC7
         d5jmzm6U02kK6ami7ivCf75b+xSSgTkFTbZ8ciQ60jab6AaXyKsZHet80jvLnl30FMTz
         tCNg==
X-Forwarded-Encrypted: i=1; AJvYcCWLiDvPUN2aoVw5xOORzbM0FTm1SL5OZOINOo6wrucu5lNdpczsOVbAYUR5TJUcnEoD72jAzSJQ10UPfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU115u/GJWs4Z1n8Ltl4g9KAIRbCxxyMKGQcjCFjHbrVYQV+T2
	+TOdOfsTqpbm3jugSheEC6Jgc1zYxxwH/nKSj99poSDoBbExX9gLFARlhb6PPugt3BlqWDMfcAe
	NUKru7TJ5Vt5B+YdImVSokpolgB+x0FzK4kztuIPcjQ==
X-Gm-Gg: AY/fxX6gL3VJWYV5hUTHKMqZ4XAd9g3j/YmnjNChBWMo/Y7xABlQvDOXBc2yMTSOKBT
	6FVC4NqYJKHYXFNU3R3dnFprwyPtmQj3P0jNvdyN6BNei6nT4YF7nbePQNwWthLSL7p9vMZ11N1
	ZAoC64Jt3V7Dm9vsRJ2CsEdbK63whsI8s2mBkv6VOdwBYMrsMbf4f+bbeOkLfWfxpk6poaKIe5Z
	dn2rnfAcFDqTmTNDO2ML4lU41KPbMGYVq69hpjmsACPIwYcOrNwQGNfPqlXnusSo4utRF13saAx
	4c8fqhss7OZz/svNNLatCAD1OqW2suL0+KKJGSq+gkaDyr4Cy8Cq1IhrQYYP1v4iiLld
X-Google-Smtp-Source: AGHT+IEwkcDRlFymm0SPcnTgEwcBBNPUXBq54o6AH1iKbZWNrVdE8TDy/EhnihwLQhHoswrfeUq7eC4nfF3TU8/lvoI=
X-Received: by 2002:a4a:dcc8:0:b0:65d:7e5:d49d with SMTP id
 006d021491bc7-65d0eade78cmr16123734eaf.72.1767587493534; Sun, 04 Jan 2026
 20:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com> <20260104135938.524-3-naohiko.shimizu@gmail.com>
In-Reply-To: <20260104135938.524-3-naohiko.shimizu@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 10:01:22 +0530
X-Gm-Features: AQt7F2oifOmggNLxX3Gj-6EJLO4qsWCjAuonxgnVcRqV8UojPRmnf2HWnXWgnm4
Message-ID: <CAAhSdy2rH5Jt5t7zCRfFd5d1X7qG41QoUuWvKgwuKX=X3Wk6cA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_203135_321112_390542FE 
X-CRM114-Status: GOOD (  17.61  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjMw4oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFJWMzIsIHVwZGF0aW5nIHRoZSA2NC1i
aXQgc3RpbWVjbXAgKG9yIHZzdGltZWNtcCkgQ1NSIHJlcXVpcmVzIHR3bwo+IHNlcGFyYXRlIDMy
LWJpdCB3cml0ZXMuIEEgcmFjZSBjb25kaXRpb24gZXhpc3RzIGlmIHRoZSB0aW1lciB0cmlnZ2Vy
cwo+IGR1cmluZyB0aGVzZSB0d28gd3JpdGVzLgo+Cj4gVGhlIFJJU0MtViBQcml2aWxlZ2VkIFNw
ZWNpZmljYXRpb24gKGUuZy4sIFNlY3Rpb24gMy4yLjEgZm9yIG10aW1lY21wKQo+IHJlY29tbWVu
ZHMgYSBzcGVjaWZpYyAzLXN0ZXAgc2VxdWVuY2UgdG8gYXZvaWQgc3B1cmlvdXMgaW50ZXJydXB0
cwo+IHdoZW4gdXBkYXRpbmcgNjQtYml0IGNvbXBhcmlzb24gcmVnaXN0ZXJzIG9uIDMyLWJpdCBz
eXN0ZW1zOgo+Cj4gMS4gU2V0IHRoZSBsb3ctb3JkZXIgYml0cyAoc3RpbWVjbXApIHRvIGFsbCBv
bmVzIChVTE9OR19NQVgpLgo+IDIuIFNldCB0aGUgaGlnaC1vcmRlciBiaXRzIChzdGltZWNtcGgp
IHRvIHRoZSBkZXNpcmVkIHZhbHVlLgo+IDMuIFNldCB0aGUgbG93LW9yZGVyIGJpdHMgKHN0aW1l
Y21wKSB0byB0aGUgZGVzaXJlZCB2YWx1ZS4KPgo+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gd3Jp
dGVzIHRoZSBMU0IgZmlyc3Qgd2l0aG91dCBlbnN1cmluZyBhIGZ1dHVyZQo+IHZhbHVlLCB3aGlj
aCBtYXkgbGVhZCB0byBhIHRyYW5zaWVudCBzdGF0ZSB3aGVyZSB0aGUgNjQtYml0IGNvbXBhcmlz
b24KPiBpcyBpbmNvcnJlY3RseSBldmFsdWF0ZWQgYXMgImV4cGlyZWQiIGJ5IHRoZSBoYXJkd2Fy
ZS4gVGhpcyByZXN1bHRzIGluCj4gc3B1cmlvdXMgdGltZXIgaW50ZXJydXB0cy4KPgo+IFRoaXMg
cGF0Y2ggYWRvcHRzIHRoZSBzcGVjLXJlY29tbWVuZGVkIDMtc3RlcCBzZXF1ZW5jZSB0byBlbnN1
cmUgdGhlCj4gaW50ZXJtZWRpYXRlIDY0LWJpdCBzdGF0ZSBpcyBuZXZlciBzbWFsbGVyIHRoYW4g
dGhlIGN1cnJlbnQgdGltZS4KPgo+IEZpeGVzOiA4ZjVjYjQ0YjFiYWUgKCJSSVNDLVY6IEtWTTog
U3VwcG9ydCBzc3RjIGV4dGVuc2lvbiIpCj4gU2lnbmVkLW9mZi1ieTogTmFvaGlrbyBTaGltaXp1
IDxuYW9oaWtvLnNoaW1penVAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9yIExpbnV4
LTYuMTkuCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIu
YyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV90aW1lci5jCj4gaW5kZXggODVhNzI2MjExNWUxLi5mMzYyNDdlNGM3
ODMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV90aW1lci5jCj4gQEAgLTcyLDggKzcyLDkgQEAgc3RhdGljIGludCBr
dm1fcmlzY3ZfdmNwdV90aW1lcl9jYW5jZWwoc3RydWN0IGt2bV92Y3B1X3RpbWVyICp0KQo+ICBz
dGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X3VwZGF0ZV92c3RpbWVjbXAoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1NjQgbmN5Y2xlcykKPiAgewo+ICAjaWYgZGVmaW5lZChDT05GSUdfMzJCSVQpCj4g
LSAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVAsIG5jeWNsZXMgJiAweEZGRkZGRkZGKTsK
PiArICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgIFVMT05HX01BWCk7Cj4gICAgICAg
ICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVBILCBuY3ljbGVzID4+IDMyKTsKPiArICAgICAgIG5j
c3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgKHUzMiluY3ljbGVzKTsKPiAgI2Vsc2UKPiAgICAgICAg
IG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgbmN5Y2xlcyk7Cj4gICNlbmRpZgo+IEBAIC0zMDcs
OCArMzA4LDkgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV90aW1lcl9yZXN0b3JlKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICNpZiBkZWZpbmVkKENP
TkZJR18zMkJJVCkKPiAtICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgKHUzMil0LT5u
ZXh0X2N5Y2xlcyk7Cj4gKyAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVAsIFVMT05HX01B
WCk7Cj4gICAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVBILCAodTMyKSh0LT5uZXh0X2N5
Y2xlcyA+PiAzMikpOwo+ICsgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1FQ01QLCAodTMyKSh0
LT5uZXh0X2N5Y2xlcykpOwo+ICAjZWxzZQo+ICAgICAgICAgbmNzcl93cml0ZShDU1JfVlNUSU1F
Q01QLCB0LT5uZXh0X2N5Y2xlcyk7Cj4gICNlbmRpZgo+IC0tCj4gMi4zOS41Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
