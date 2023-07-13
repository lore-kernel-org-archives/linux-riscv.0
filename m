Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6180C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=riNF05IFlsTJgG0t35F5Z20RzyZdSNggQSCIq9EGHIY=; b=q9mnlqZKOXCZyEXyjbgRCgfx2Z
	HThtHhR8GN8EsuFW/uKUW2t0TiKDfIqcwpjDKnjlYodIY8eabaf7QuYrky2hgQHAwBadbOTYu67f7
	su9RNNHh5h+ecvh8ALMZO7fJF+JOZOJjMH3kzYaHt4cCLo2deh0U5YCFNDaSHgIHcqWQuv6MFhabv
	lvdWAPjcFR/o4AC3kmb4znGo5ufICrOApTui9RpSZdyMAeNxIa1i/CgJhMPTpb3vSG6NCYleCrERL
	iw4WJczibd2muZsOFXEKr/W+hRd0KMrRXOHc9swrQMXZlUIUrlraTEp9NDaKAwgX6cEyM/LZef9iO
	E+kYzS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Lw-0044qA-2R;
	Thu, 13 Jul 2023 17:43:44 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Lt-0044pR-1U
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 17:43:43 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a3efee1d44so776409b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689270219; x=1691862219;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF6A7orMLJDIsCgkc66l+Ah2xgva1++Z+dlr59tdXNM=;
        b=ljDvqQ1ptXjYbmFu29Q1OJUgTAhPK7OiHwIdwMasf7ig48+6Qs58DvPcEwsgRicU3z
         mp7i6+JjWanGoRDSBl5yw26Z+XO/Yt6knijT/8MgczUx8m7ieqqmrVBFI8W/GfD1Q1Uk
         Q/fkYlMsgGu2pegqCh8j5PU6TfnH9NpWGD9kdiQoQhV8ju4D+7Aj+Ynigeyl1zIszJgp
         vd5gew/9OMqQVF6oA+qU6sAgjeJrD7N2m2vbtUrco/aGV991hHxQTGg+m5+qj+39XYyc
         UIaJdMjVTXV3kp10n861mEqdh2CXQS7NqzW0jyGyQNC7LyInyvsahKubO2OGMGV1hvci
         INeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689270219; x=1691862219;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vF6A7orMLJDIsCgkc66l+Ah2xgva1++Z+dlr59tdXNM=;
        b=Vf/YA1LRvZQ9jzRUcnfVF3VvnM8M8+2b4RCKNiNf2UqDbtAC+J/UbCSFR2mXpbVtLD
         wc4LBOF8wRfKnShQq24SYK5drGxFRuru2MibXe2vkGAPpp5ovCCQ1csESiLVMnll7gzw
         vaAF9gke0rC4buqomlFWf6gOMWRdlGALBjX6fOGEBCcwHOQLAS06BD40oC8PdTzDkdrh
         xCvArv99lk7QK+VKqq2UOUsBlE9sRZTUbc75LgBLO3CNhHqRRIBD093N44VHzuRZX8GC
         myDvW5Ww/EWnS3ApXs+F9pjKUZ9L5kjdafNUJZqLcBZKsPF+s6OnEjLYljtXtt9KTVo2
         wSMA==
X-Gm-Message-State: ABy/qLawWXCKLKDbVS0u8/sGESamru4WxOeb01tpsSWOAkrbm7Kd8g63
	eg1Ez1Zj956Vbjt5iLGQh1BUeg==
X-Google-Smtp-Source: APBJJlH+YBGrmU3VngE+6LhnkIPF+ObXmOgaWvBGdj69NGtcpCxQqupYYxt0gTdnvK3wz2ZvscmR7Q==
X-Received: by 2002:a05:6358:931a:b0:130:ebb9:4283 with SMTP id x26-20020a056358931a00b00130ebb94283mr2754486rwa.22.1689270219091;
        Thu, 13 Jul 2023 10:43:39 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id k12-20020a637b4c000000b0054ff9032e4dsm5857190pgn.18.2023.07.13.10.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:43:38 -0700 (PDT)
Date: Thu, 13 Jul 2023 10:43:38 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Jul 2023 10:42:52 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property on T-Head CPUs
In-Reply-To: <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
CC: jszhang@kernel.org, Conor Dooley <conor@kernel.org>,
  Heiko Stuebner <heiko@sntech.de>, Charlie Jenkins <charlie@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: guoren@kernel.org
Message-ID: <mhng-6fd2f512-ed1b-49a2-8189-82bd5e331121@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_104341_498098_789E0A4D 
X-CRM114-Status: GOOD (  38.49  )
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

T24gVGh1LCAxMyBKdWwgMjAyMyAxMDozMzo1NiBQRFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gT24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMTI6NDjigK9QTSBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIEp1bCAxMiwgMjAy
MyBhdCAwNjo0ODowMlBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+ID4gRnJvbTogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+ID4KPj4gPiBUaGUgbGFzdCBtZXJn
ZSB3aW5kb3cgY29udGFpbmVkIGJvdGggViBzdXBwb3J0IGFuZCB0aGUgZGVwcmVjYXRpb24gb2YK
Pj4gPiB0aGUgcmlzY3YsaXNhIERUIHByb3BlcnR5LCB3aXRoIHRoZSBWIGltcGxlbWVudGF0aW9u
IHJlYWRpbmcgcmlzY3YsaXNhCj4+ID4gdG8gZGV0ZXJtaW5lIHRoZSBwcmVzZW5jZSBvZiB0aGUg
ViBleHRlbnNpb24uICBBdCB0aGUgdGltZSB0aGF0IHdhcyB0aGUKPj4gPiBvbmx5IHdheSB0byBk
byBpdCwgYnV0IHRoZXJlJ3MgYSBsb3Qgb2YgYW1iaWd1aXR5IGFyb3VuZCBWIGluIElTQQo+PiA+
IHN0cmluZ3MuICBJbiBwYXJ0aWN1bGFyLCB0aGVyZSBpcyBhIGxvdCBvZiBmaXJtd2FyZSBpbiB0
aGUgd2lsZCB0aGF0Cj4+ID4gdXNlcyAidiIgaW4gdGhlIHJpc2N2LGlzYSBEVCBwcm9wZXJ0eSB0
byBjb21tdW5pY2F0ZSBzdXBwb3J0IGZvciB0aGUKPj4gPiAwLjcuMSB2ZXJzaW9uIG9mIHRoZSBW
ZWN0b3Igc3BlY2lmaWNhdGlvbiBpbXBsZW1lbnRlZCBieSBULUhlYWQgQ1BVCj4+ID4gY29yZXMu
Cj4+Cj4+IEFkZCBHdW8KPj4KPj4gSGkgQ29ub3IsIFBhbG1lciwKPj4KPj4gRldJQ1QsIG5ldyBU
LUhFQUQncyByaXNjdiBjb3JlcyBzdWNoIGFzIEM5MDggc3VwcG9ydCBzdGFuZGFyZCBSVlYtMS4w
LAo+PiB0aGlzIHBhdGNoIGxvb2tzIGxpa2UgYSBiaWcgaGFtbWVyIGZvciBULUhFQUQuIEkgZG8g
dW5kZXJzdGFuZCB3aHkKPj4gdGhpcyBwYXRjaCBpcyBwcm92aWRlZCwgYnV0IGNhbiB3ZSBtaXRp
Z2F0ZSB0aGUgc2l0dWF0aW9uIGJ5IGNhcmVmdWxseQo+PiByZXZpZXcgdGhlIERUcz8gUGVyIG15
IHVuZGVyc3RhbmRpbmcsIGR0cyBpcyBhbHNvIHBhcnQgb2YgbGludXgga2VybmVsLgo+Pgo+PiBU
aGFua3MKPj4KPj4gPgo+PiA+IFJhdGhlciB0aGFuIGZvcmNpbmcgdXNlIG9mIHRoZSBuZXdseSBh
ZGRlZCBpbnRlcmZhY2UgdGhhdCBoYXMgc3RyaWN0Cj4+ID4gbWVhbmluZ3MgZm9yIGV4dGVuc2lv
bnMgdG8gZGV0ZWN0IHRoZSBwcmVzZW5jZSBvZiB2ZWN0b3Igc3VwcG9ydCwgYXMKPj4gPiB0aGF0
IHdvdWxkIHBlbmFsaXNlIHRob3NlIHdobyBoYXZlIGJlaGF2ZWQsIG9ubHkgaWdub3JlIHYgaW4g
cmlzY3YsaXNhCj4+ID4gb24gQ1BVcyB0aGF0IHJlcG9ydCBULUhlYWQncyB2ZW5kb3IgSUQuCj4+
ID4KPj4gPiBGaXhlczogZGM2NjY3YTRlN2UzICgicmlzY3Y6IEV4dGVuZGluZyBjcHVmZWF0dXJl
LmMgdG8gZGV0ZWN0IFYtZXh0ZW5zaW9uIikKPj4gPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4gPiBDby1kZXZlbG9wZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+ID4gU2lnbmVkLW9mZi1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4gPiAtLS0KPj4gPiBDaGFu
Z2VzIGluIHYyOgo+PiA+IC0gVXNlIG15IHZlcnNpb24gb2YgdGhlIHBhdGNoIHRoYXQgdG91Y2hl
cyBod2NhcCBhbmQgaXNhaW5mbyB1bmlmb3JtbHkKPj4gPiAtIERvbid0IHBlbmFsaXNlIHRob3Nl
IHdobyBiZWhhdmVkCj4+ID4gLS0tCj4+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKykKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4gPiBpbmRleCBiZGNm
NDYwZWE1M2QuLjA1MzYyNzE1ZTFiNyAxMDA2NDQKPj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
Pj4gPiBAQCAtMjEsNiArMjEsNyBAQAo+PiA+ICAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4+ID4g
ICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KPj4gPiAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4K
Pj4gPiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPj4gPiAgI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4K
Pj4gPgo+PiA+ICAjZGVmaW5lIE5VTV9BTFBIQV9FWFRTICgneicgLSAnYScgKyAxKQo+PiA+IEBA
IC0zMzQsNiArMzM1LDI3IEBAIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkKPj4g
PiAgICAgICAgICAgICAgICAgICAgICAgc2V0X2JpdChSSVNDVl9JU0FfRVhUX1pJSFBNLCBpc2Fp
bmZvLT5pc2EpOwo+PiA+ICAgICAgICAgICAgICAgfQo+PiA+Cj4+ID4gKyAgICAgICAgICAgICAv
Kgo+PiA+ICsgICAgICAgICAgICAgICogIlYiIGluIElTQSBzdHJpbmdzIGlzIGFtYmlndW91cyBp
biBwcmFjdGljZTogaXQgc2hvdWxkIG1lYW4KPj4gPiArICAgICAgICAgICAgICAqIGp1c3QgdGhl
IHN0YW5kYXJkIFYtMS4wIGJ1dCB2ZW5kb3JzIGFyZW4ndCB3ZWxsIGJlaGF2ZWQuCj4+ID4gKyAg
ICAgICAgICAgICAgKiBNYW55IHZlbmRvcnMgd2l0aCBULUhlYWQgQ1BVIGNvcmVzIHdoaWNoIGlt
cGxlbWVudCB0aGUgMC43LjEKPj4gPiArICAgICAgICAgICAgICAqIHZlcnNpb24gb2YgdGhlIHZl
Y3RvciBzcGVjaWZpY2F0aW9uIHB1dCAidiIgaW50byB0aGVpciBEVHMKPj4gPiArICAgICAgICAg
ICAgICAqIGFuZCBubyBULUhlYWQgQ1BVIGNvcmVzIHdpdGggdGhlIHN0YW5kYXJkIHZlcnNpb24g
b2YgdmVjdG9yCj4+ID4gKyAgICAgICAgICAgICAgKiBhcmUgaW4gY2lyY3VsYXRpb24geWV0Lgo+
IFQtSEVBRCdzIHZlY3RvciAxLjAgU29DcyBpcyBpbiBjaXJjdWxhdGlvbi4gS2VuZHJ5dGUgSzIz
MCBpcyB0aGUKPiBzaGlwcGVkIFNvQyBjaGlwLCB3aGljaCB2ZW5kb3IgaWQgPSBUSEVBRF9WRU5E
T1JfSUQgYW5kIHdpdGggdmVjdG9yCj4gMS4wLgoKRG8geW91IGhhdmUgYSBwb2ludGVyIHRvIHdo
ZXJlIHRoZXkncmUgYXZhaWxpYWJsZT8gIEtlbmRyeXRlJ3Mgd2Vic2l0ZSAKZG9lc24ndCBsaXN0
IGEgSzIzMCB5ZXQ6IGh0dHBzOi8vd3d3LmNhbmFhbi5pby9wcm9kdWN0L2tlbmRyeXRlYWkjIyAu
ICAKVGhleSdkIGJlIHRoZSBmaXJzdCBWLTEuMCBpbXBsZW1lbnRhdGlvbiBpbiB0aGUgd2lsZCwg
SSBiZXQgYSBsb3Qgb2YgCnBlb3BsZSB3b3VsZCB3YW50IG9uZSB0byBwbGF5IHdpdGguLi4KCj4K
Pj4gPiArICAgICAgICAgICAgICAqIFBsYXRmb3JtcyB3aXRoIFQtSGVhZCBDUFUgY29yZXMgdGhh
dCBzdXBwb3J0IHRoZSBzdGFuZGFyZAo+PiA+ICsgICAgICAgICAgICAgICogdmVyc2lvbiBvZiB2
ZWN0b3IgbXVzdCBwcm92aWRlIHRoZSBleHBsaWNpdCBWIHByb3BlcnR5LAo+PiA+ICsgICAgICAg
ICAgICAgICogd2hpY2ggaXMgd2VsbCBkZWZpbmVkLgo+PiA+ICsgICAgICAgICAgICAgICovCj4+
ID4gKyAgICAgICAgICAgICBpZiAoYWNwaV9kaXNhYmxlZCAmJiByaXNjdl9jYWNoZWRfbXZlbmRv
cmlkKGNwdSkgPT0gVEhFQURfVkVORE9SX0lEKSB7Cj4gSWYgeW91IGluc2lzdCBvbiBkb2luZyB0
aGlzLCBwbGVhc2U6Cj4KPiBpZiAoYWNwaV9kaXNhYmxlZCAmJiByaXNjdl9jYWNoZWRfbXZlbmRv
cmlkKGNwdSkgPT0gVEhFQURfVkVORE9SX0lEICYmCj4gcmlzY3ZfY2FjaGVkX21hcmNoaWQoY3B1
KSA9PSAwICYmIHJpc2N2X2NhY2hlZF9taW1waWQoY3B1KSA9PSAwKSB7CgpGcm9tIGFib3ZlIGl0
IHNvdW5kcyBsaWtlIHRoYXQncyBPSyBmb3IgdGhlIEM5MjAuICBEb2VzIHRoZSBDOTA4IHNldCBh
IApub24temVybyBte2FyY2gsaW1wbH1pZD8gIElmIG5vdCwgdGhlbiB0aGlzIHdvbid0IGhlbHAg
YW55dGhpbmcuCgpBbHNvOiBkb2VzIHRoZSBLMjMwIHdvcmsgd2l0aCB1cHN0cmVhbSBrZXJuZWxz
IHlldD8gIEkgZG9uJ3Qgc2VlIGFueSBEVCAKc3R1ZmYgZm9yIGl0LCBzbyBhc2lkZSBmcm9tIHRo
ZSB1bmxpa2VseSBldmVudCBpdCdzIHF1aXJrLWZyZWUgdGhlbiBpdCdkIApuZWVkIERUcyBjaGFu
Z2VkIGJ5IHVwc3RyZWFtIHJldmlldyBhbmQgdGh1cyB3b3VsZCBiZSBmb3JjZWQgdG8gdXNlIHRo
ZSAKbmV3IHByb3BlcnRpZXMgYW55d2F5LgoKPj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYg
KG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhub2RlLCAicmlzY3YsaXNhLWV4dGVuc2lvbnMiLCAi
diIpID49IDApIHsKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aGlzX2h3Y2Fw
IHw9IGlzYTJod2NhcFtSSVNDVl9JU0FfRVhUX3ZdOwo+PiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF92LCBpc2FpbmZvLT5pc2EpOwo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRoaXNfaHdjYXAgJj0gfmlzYTJod2NhcFtSSVNDVl9JU0FfRVhUX3ZdOwo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsZWFyX2JpdChSSVNDVl9JU0FfRVhUX3YsIGlz
YWluZm8tPmlzYSk7Cj4+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPj4gPiArICAgICAgICAg
ICAgIH0KPj4gPiArCj4+ID4gICAgICAgICAgICAgICAvKgo+PiA+ICAgICAgICAgICAgICAgICog
QWxsICJva2F5IiBoYXJ0IHNob3VsZCBoYXZlIHNhbWUgaXNhLiBTZXQgSFdDQVAgYmFzZWQgb24K
Pj4gPiAgICAgICAgICAgICAgICAqIGNvbW1vbiBjYXBhYmlsaXRpZXMgb2YgZXZlcnkgIm9rYXki
IGhhcnQsIGluIGNhc2UgdGhleSBkb24ndAo+PiA+IC0tCj4+ID4gMi4zOS4yCj4+ID4KPj4gPgo+
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+ID4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKPgo+Cj4KPiAtLSAKPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
