Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F0DFF494B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 06:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYCZiOWQLPUr4e8Lgzm0hAhsAdxYH/SJ8Jxbc4GG9cM=; b=eiFG+rIDWD6if9
	bbW1FR5f3X1eQkmQlC123+z44bnJfIbX4TecqNQs1Z39cWyK3n6ZSdl0O3EV2ZvtIGG7xvFZd1C2r
	B1oy5kdrjPqx3AQeUvguUjm5Cntsq+sBgQFq0VM41S41WD1v70UQSexJLw0xZ/pgI9lNRQlr65qNJ
	MljIRqzyCQXQpRErGAu/jbmQA9WBqtT3BevSj2CbJxRGnbAPpTGv50AphYROwmsu+VW8Ffh0aANsh
	Tz1h5Zm16Wp9fCFDNd8aznS85lQGGepF+leee2z+97oFOQRJRIF2w655MX5xeE5bST6LcGDYor4hJ
	/6aB+aB1grg0DQq/MEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764j-0000000AgRM-0C6i;
	Mon, 30 Mar 2026 06:26:13 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764g-0000000AgOT-0ipA
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 06:26:11 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-67df51b26ddso2593847eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 23:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774851969; cv=none;
        d=google.com; s=arc-20240605;
        b=K6hXuzEfExjI0Dw9xOUFUtPvnPik5bFmORczZZqlSoWb4tzn4gNLFvt0qAx4ApTDFb
         ZX5UuYBCunki9lDIs7oEEg8+LtRKlnW9VBXhx/5ooZM5GvmM2vQRn30pB1cNr9Ec1pUF
         hTrRL3yPrcfsfwzwGz+8253OGiCNZNthKkXwBwRv3mDVFF4OFIOnPUzp+hq0q8Uv1NjP
         h6TNhY+9V/VDF8c9sjvWbb5k5G3gQOvyYpZSovPdP24cY+4svWinsVX0eUoRahNXFJgN
         HqeVMH7yT35SXAof5e9at4Batx3K7tfGkBiVaSMvjplwPpjBgvcWWpeAbcULYNV0/r/i
         nnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7ukPQa8UA4mhzoG0Xk36CRAuFWmAhxbj7qoH+L5GUg=;
        fh=UcCNLehJrdv8KyrqzacMj/MDVHfn85zk+ALk7LzJCII=;
        b=YkZ8Cm/2bxfVFCJVaRaF6jJuMVSenKwvEnOOyWooPiZ8/ggyJX/BJtlZjr2NEpYb66
         0LRjsAnwxH/aIX2+naMEZW9yNXyi0DI05uKhfSGuxW8z9HKO61U7eZKu2d5MXWHulCgF
         WMse+YbCUTgflHhS3lyvM/HMEoXn6xJYasfefG7hz/EfLPTJBJ/ZQ16ohY6F+F0/5A3Y
         whXluf3rkQTG+OPM7y6Zvee2cyMqXvdeYs3FpK2FtUZhJfVNKeIlPucgETdXHsfOqPdZ
         Os6roZYneIO2UvQx/3+Yg0XgCYInp/+V3ekxM6l76OSCtTPixEbqovP1tibSkc+PUc4T
         9HrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774851969; x=1775456769; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7ukPQa8UA4mhzoG0Xk36CRAuFWmAhxbj7qoH+L5GUg=;
        b=kL/x2r5EaWwBIIn4ybtY2gDuBWRftUJEZsVvS/HfbkD2Aos3SaSRbBYqifu/x4MRxP
         Q9mSqshla5fFLULMSV4CIhvedc58bVIwZ/UyN4rwFteAVoqDkpJM39ckXG9OTenBBHv6
         DRXqdfUzJJdoUbr3ZzRPMrq9eQ2GgbMiu3Daz/ppYBIpaaUTRLwJsbhzP9/Iu49FG/RP
         0HLbS0g+ENx11g1bKqnP8Jkny9v55kebXsZuLYAKUnA6h0zoEpp0dveKBDk6gzs4rV5d
         PgNFyfQzfCxJY+9p04jltrakvjU/9B9ZlUncPEko9Ve0dXt74yjEyuIHWIEtNndpQHtT
         GRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851969; x=1775456769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S7ukPQa8UA4mhzoG0Xk36CRAuFWmAhxbj7qoH+L5GUg=;
        b=KjisCPYpmMqMQKRoEnv25FhBjAz6WXpFno4CrYVvsal+0qXPSrotIyJXjmAbGb98bs
         TB+79DQ25Pg590R6fSXmqVYrh1n4oc1FfnI7Ge9lxbZjkmq1tSx2mDkeGgG2S0vtZoOV
         YqX6UbefFBVkcSk4RHJoOoLjVmC0D4t9BE6s8t1tt+Pf+JRYmoM9ahBzh+4C8D+OJHAj
         cLJCkM5u2adNBkdhh2MsiOQaA7nTQwOoI2S2zPUX2E6MpF1M4XBETyanFphxZzJ03yPV
         eWY07h8r7dpvmTs5blW3DL+JFKKOb04bxvprbB6aKZMJtpNgWYHxXRn+TXgIBQy4SsuO
         4pxw==
X-Forwarded-Encrypted: i=1; AJvYcCVww3UWyc+u8SXEgiD7CmCNEivLs3cmk9gEseoHAm3qcCgb00LiEymklAxCuszDLzma53VKBVOhTfbP0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8z8L5wp1fQ/ITVIVTUsuhkQaexsowFHpq+kLWQcxXfe0dikmR
	v5FeAP3O01TGqnvEL8y6H/iQ6BSYPBd/n8V6n0oSkV+HNprYkduG8tmHGarydyW7P1gLMizWww3
	4RMtdoQDl9z/bvprDEwULjZrs7XF9itLA1ALaykE7mQ==
X-Gm-Gg: ATEYQzzLcBz6Bp9LfjxeWUnBuAhp3rtVObIiQh/RnlqUa10S6noCaiDUE0+yGtsYggR
	/iRDegK/GrqKoouxFQ69nEHBzyXTPCHg/5P+0XNXLqTZEvpLi4wuVVxVf3W6EsqZePeHHI2v8Ba
	GsURwpodSGTWmaq71IQLANJ2J5f3MT5xK8t2zsrAVrcl4N5T+u67W9+VAEj1KG0D9J/8ApofLYv
	JaEB6VK3TkUHszpGaEgoiJYkQBypoiZoeLc93fSPGefVyOcqdVgSZ/cNeQlcTbYSelvAKR/feuS
	auEDrqbQV8KWjmS1B64gyFBadcvrT+ojxbODVhCE23Syp8WOIfEQ5JIQENmNd+VRI/FtYykY+zp
	clwWxNAHSx1Di4hJBpjfwTK6XZw==
X-Received: by 2002:a05:6820:4b8b:b0:67e:ca3:9c25 with SMTP id
 006d021491bc7-67e1863e4e3mr5724052eaf.28.1774851968771; Sun, 29 Mar 2026
 23:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260316141234007qSAOsesu2cSQsj-LA-qq3@zte.com.cn> <20260316141836922ffC0zmiE01ptC2jpXl4zJ@zte.com.cn>
In-Reply-To: <20260316141836922ffC0zmiE01ptC2jpXl4zJ@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 11:55:56 +0530
X-Gm-Features: AQROBzBDFmkMIaqvBMfy22hBMT2RUnYhvKcW62n6PtbYmFj9Ey95kgwKiNKUHAQ
Message-ID: <CAAhSdy0KTUjSbkpW=X_hbfw2qtEhWEVSr2i85ixBw4hzxuQsxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] RISC-V: KVM: Allow splitting huge pages to
 arbitrary level
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_232610_232791_FAA569DC 
X-CRM114-Status: GOOD (  25.33  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6NDnigK9BTSA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4gd3JvdGU6Cj4KPiBGcm9tOiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4KPgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0aGUgZnVuY3Rpb24ga3ZtX3Jpc2N2X2dz
dGFnZV9zcGxpdF9odWdlKCkuCj4gSXQgc3BsaXRzIHRoZSBodWdlIHBhZ2UgY292ZXJpbmcgYSBn
aXZlbiBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIGRvd24KPiB0byBhIHNwZWNpZmllZCB0YXJnZXQg
bGV2ZWwgKGUuZy4sIGZyb20gMUcgdG8gMk0gb3IgNEspLiBUaGUgY2FsbGVyCj4gcHJvdmlkZXMg
YSBtZW1vcnkgY2FjaGUgZm9yIGFsbG9jYXRpbmcgYW55IGludGVybWVkaWF0ZSBwYWdlIHRhYmxl
cwo+IGFuZCBtYXkgcmVxdWVzdCBhIFRMQiBmbHVzaCBhZnRlciB0aGUgc3BsaXQuCj4KPiBUaGlz
IGZ1bmN0aW9uYWxpdHkgd2lsbCBiZSB1c2VkIGJ5IHN1YnNlcXVlbnQgcGF0Y2hlcyB0byBzcGxp
dCBodWdlCj4gcGFnZXMgYmVmb3JlIGhhbmRsaW5nIHRoZSB3cml0ZS1wcm90ZWN0aW9uIGZhdWx0
LCBvciBmb3Igb3RoZXIgb3BlcmF0aW9ucwo+IHRoYXQgcmVxdWlyZSBwYWdlLWxldmVsIGdyYW51
bGFyaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0
ZS5jb20uY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwg
IDQgKysKPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAgICAgICAgICAgfCA2OSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gaW5kZXggNTk1ZTIxODMxNzNl
Li4zNzM3NDhjNjc0NWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
Z3N0YWdlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+IEBA
IC01Myw2ICs1MywxMCBAQCBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9tYXBfcGFnZShzdHJ1Y3Qga3Zt
X2dzdGFnZSAqZ3N0YWdlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcGFn
ZV9yZG9ubHksIGJvb2wgcGFnZV9leGVjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBrdm1fZ3N0YWdlX21hcHBpbmcgKm91dF9tYXApOwo+Cj4gK2ludCBrdm1fcmlzY3Zf
Z3N0YWdlX3NwbGl0X2h1Z2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX21tdV9tZW1vcnlfY2FjaGUgKnBjYWNo
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBhZGRyLCB1MzIgdGFy
Z2V0X2xldmVsLCBib29sIGZsdXNoKTsKPiArCj4gIGVudW0ga3ZtX3Jpc2N2X2dzdGFnZV9vcCB7
Cj4gICAgICAgICBHU1RBR0VfT1BfTk9QID0gMCwgICAgICAvKiBOb3RoaW5nICovCj4gICAgICAg
ICBHU1RBR0VfT1BfQ0xFQVIsICAgICAgICAvKiBDbGVhci9Vbm1hcCAqLwo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5k
ZXggZDIwMDFkNTA4MDQ2Li41MzU2YWJiMTg5MzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0yMDksNiAr
MjA5LDc1IEBAIGludCBrdm1fcmlzY3ZfZ3N0YWdlX21hcF9wYWdlKHN0cnVjdCBrdm1fZ3N0YWdl
ICpnc3RhZ2UsCj4gICAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9zZXRfcHRlKGdzdGFn
ZSwgcGNhY2hlLCBvdXRfbWFwKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9u
ZyBtYWtlX2NoaWxkX3B0ZSh1bnNpZ25lZCBsb25nIGh1Z2VfcHRlLCBpbnQgaW5kZXgsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY2hp
bGRfcGFnZV9zaXplKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGNoaWxkX3B0ZSA9IGh1
Z2VfcHRlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBjaGlsZF9wZm5fb2Zmc2V0Owo+ICsKPiAr
ICAgICAgIC8qCj4gKyAgICAgICAgKiBUaGUgY2hpbGRfcHRlIGFscmVhZHkgaGFzIHRoZSBiYXNl
IGFkZHJlc3Mgb2YgdGhlIGh1Z2UgcGFnZSBiZWluZwo+ICsgICAgICAgICogc3BsaXQuIFNvIHdl
IGp1c3QgaGF2ZSB0byBPUiBpbiB0aGUgb2Zmc2V0IHRvIHRoZSBwYWdlIGF0IHRoZSBuZXh0Cj4g
KyAgICAgICAgKiBsb3dlciBsZXZlbCBmb3IgdGhlIGdpdmVuIGluZGV4Lgo+ICsgICAgICAgICov
Cj4gKyAgICAgICBjaGlsZF9wZm5fb2Zmc2V0ID0gaW5kZXggKiAoY2hpbGRfcGFnZV9zaXplIC8g
UEFHRV9TSVpFKTsKPiArICAgICAgIGNoaWxkX3B0ZSB8PSBwdGVfdmFsKHBmbl9wdGUoY2hpbGRf
cGZuX29mZnNldCwgX19wZ3Byb3QoMCkpKTsKPiArCj4gKyAgICAgICByZXR1cm4gY2hpbGRfcHRl
Owo+ICt9Cj4gKwo+ICtpbnQga3ZtX3Jpc2N2X2dzdGFnZV9zcGxpdF9odWdlKHN0cnVjdCBrdm1f
Z3N0YWdlICpnc3RhZ2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
a3ZtX21tdV9tZW1vcnlfY2FjaGUgKnBjYWNoZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdwYV90IGFkZHIsIHUzMiB0YXJnZXRfbGV2ZWwsIGJvb2wgZmx1c2gpCj4gK3sKPiAr
ICAgICAgIHUzMiBjdXJyZW50X2xldmVsID0ga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzIC0g
MTsKPiArICAgICAgIHB0ZV90ICpuZXh0X3B0ZXAgPSAocHRlX3QgKilnc3RhZ2UtPnBnZDsKPiAr
ICAgICAgIHB0ZV90ICpwdGVwOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodWdlX3B0ZSwgY2hp
bGRfcHRlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBjaGlsZF9wYWdlX3NpemU7Cj4gKyAgICAg
ICBpbnQgaSwgcmV0OwoKRGVjbGFyZSBsb2NhbCB2YXJpYWJsZXMgaW4gaW52ZXJ0ZWQgcHlyYW1p
ZCBmYXNoaW9uLgoKPiArCj4gKyAgICAgICB3aGlsZShjdXJyZW50X2xldmVsID4gdGFyZ2V0X2xl
dmVsKSB7Cj4gKyAgICAgICAgICAgICAgIHB0ZXAgPSAocHRlX3QgKikmbmV4dF9wdGVwW2dzdGFn
ZV9wdGVfaW5kZXgoYWRkciwgY3VycmVudF9sZXZlbCldOwo+ICsKPiArICAgICAgICAgICAgICAg
aWYgKCFwdGVfdmFsKHB0ZXBfZ2V0KHB0ZXApKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICghZ3N0YWdlX3B0ZV9sZWFmKHB0ZXApKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbmV4dF9wdGVwID0gKHB0ZV90ICopZ3N0YWdlX3B0
ZV9wYWdlX3ZhZGRyKHB0ZXBfZ2V0KHB0ZXApKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBj
dXJyZW50X2xldmVsLS07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKyAg
ICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGh1Z2VfcHRlID0gcHRlX3ZhbChw
dGVwX2dldChwdGVwKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICByZXQgPSBnc3RhZ2VfbGV2ZWxf
dG9fcGFnZV9zaXplKGN1cnJlbnRfbGV2ZWwgLSAxLCAmY2hpbGRfcGFnZV9zaXplKTsKPiArICAg
ICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Owo+ICsKPiArICAgICAgICAgICAgICAgaWYgKCFwY2FjaGUpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07CgpUaGlzIGNoZWNrcyBuZWVkcyB0byBiZSBvdXRzaWRlIHdo
aWxlLWxvb3AuCgo+ICsgICAgICAgICAgICAgICBuZXh0X3B0ZXAgPSBrdm1fbW11X21lbW9yeV9j
YWNoZV9hbGxvYyhwY2FjaGUpOwo+ICsgICAgICAgICAgICAgICBpZiAoIW5leHRfcHRlcCkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAgICAgICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBQVFJTX1BFUl9QVEU7IGkrKykgewo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNoaWxkX3B0ZSA9IG1ha2VfY2hpbGRfcHRlKGh1Z2VfcHRlLCBpLCBjaGlsZF9w
YWdlX3NpemUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNldF9wdGUoKHB0ZV90ICopJm5l
eHRfcHRlcFtpXSwgX19wdGUoY2hpbGRfcHRlKSk7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4g
KyAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwgcGZuX3B0ZShQRk5fRE9XTihfX3BhKG5leHRf
cHRlcCkpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19wZ3Byb3QoX1BBR0Vf
VEFCTEUpKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoZmx1c2gpCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZ3N0YWdlX3RsYl9mbHVzaChnc3RhZ2UsIGN1cnJlbnRfbGV2ZWwsIGFkZHIp
Owo+ICsKPiArICAgICAgICAgICAgICAgY3VycmVudF9sZXZlbC0tOwo+ICsgICAgICAgfQo+ICsK
PiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfb3Bf
cHRlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IGFkZHIsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwdGVfdCAqcHRlcCwgdTMyIHB0ZXBfbGV2ZWwsIGVudW0ga3ZtX3Jp
c2N2X2dzdGFnZV9vcCBvcCkKPiAgewo+IC0tCj4gMi4yNy4wCgpUaGUga3ZtX3Jpc2N2X2dzdGFn
ZV9zcGxpdF9odWdlKCkgZnVuY3Rpb24gaW50cm9kdWNlZCBoZXJlCmlzIG9ubHkgdXNlZCBpbiBQ
QVRDSDMgc28gYmV0dGVyIHNxYXNoIHRoaXMgcGF0Y2ggaW50byBQQVRDSDMuCgpSZWdhcmRzLApB
bnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
