Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932B8C54798
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIgsyuF+3/7AJDENKvyFlaCRBN/dlCQRaXsf27o4mac=; b=RdR7wjabwzDlC4
	4dnfkg4uYU96E6dJqHScLNYAs8yspRN//nOeeKYnDFL1ZM2xjqYrCiRLzTxXwN+Ro7WFfZcM0atSz
	P1RnyiseV0PcJ59cmha7CJze6vzXA5w/UjlH1MrfZptv3V3tOR4u/+S6bQz0NY+viSUlrQzipqMDT
	+UFdfkqufybQB/ucGFBA9lxEBFE/ahFcG/Rq9ci6vAP49Eo6ueU07PUPGfxjoXHhDNZ0BZhusKMOr
	B25Y1ABLfk32s5wt0I3oR4b2Tadw5ozIlo62+aA9Z9sgG2A2i4pLrXMhi8w45I7+yjH1tvek3SU2q
	Yb1cdoehn9xgqT8phKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1risfc-0000000Cxw2-23kW;
	Sat, 09 Mar 2024 09:07:08 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1risfY-0000000CxtI-1cfR
	for linux-riscv@lists.infradead.org;
	Sat, 09 Mar 2024 09:07:06 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d3f962a9dfso16379211fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 09 Mar 2024 01:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1709975219; x=1710580019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNdlMdkn4bMFHas/qBV23J69CT6Id0msg2LlxZZUy+s=;
        b=Kr3nPB/D3sz2eE9ZHqPeXNz8VSzFduclyL3tVUaFw0qBvhlbpZ0P0BSjt7LFJo7RNu
         8ELZK9ij6bzDqkwDqXtMT/eOKBlcj+7QnQDxRzAbSZxohm27dDW9dwaKN5RInyi6gIBA
         f91xQRwXvJ5BmDUqArs9q2mwP4wyy5G8ib8eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709975219; x=1710580019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNdlMdkn4bMFHas/qBV23J69CT6Id0msg2LlxZZUy+s=;
        b=L27yb07rW2aP92I4jIqAZGDm1r1xEvSNiyNb/Dv7m0rFMjLTt2F00xqr/3BHjbEF6S
         DVL+gtZRx29JTAqIz3aGcYSAw0pQbrqyDk0F/EZdsmmLxsJDXq0Xoro9vQALmXGACMxD
         w95TgQPLgEBXLvDLs1UaRCm6+e+IVGijw0/N/p2nGHpTuA5Nk5Q9kLftNkACD/ikXnvA
         OShyPBGupgOm8p9N/GORxotf+vFkF3dyxKjPeYcDgvrvW5j64ilz8IIx7ibcowJVCN8x
         jcKV4phxytGuEfDqtwZSoELsAjy+n9JzwYai6K7iBKUfyxyYF6mZLWFAw7LuGFlLvdKR
         8JTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe7VA2NPEa+flvgg0Q9unvJDoRjT1VMYL5eW8fmDiX5AIbs41TEseSei8aNY0LzitJBoM2VyNELzK00nepTWpzHtRfzz87XxmwozkG8Yz1
X-Gm-Message-State: AOJu0Ywi8/Tq2ygT8/gp2w3Q5qBhjhMvseRXwZl6EHyuyzBfX8BkBtA/
	NcaUs+GVG/qTV0APB8xscbhRGbg1wh3AIv/BOVp39lFsKMejos624MPdl679NAiKQtrvdXld1Fk
	s8RFhySybYfgX0+1rxww5ub5phTPT/BEp0hvD
X-Google-Smtp-Source: AGHT+IFpdRnYAABErZrctDTk9xaZbFcDKBNE/D76fhc3ClEbqi8MUiSIDabeDH3SCHBMdgDcwbD3SrZ3B4Jkh0jzKKI=
X-Received: by 2002:a05:651c:b26:b0:2d3:f3bc:bb65 with SMTP id
 b38-20020a05651c0b2600b002d3f3bcbb65mr1136662ljr.11.1709975219088; Sat, 09
 Mar 2024 01:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20240305155223.1823287-1-pulehui@huaweicloud.com>
 <20240307-oat-mule-10441ef7e94a@spud> <f399749b-85bf-4aaf-8af6-ea735c5ab517@huaweicloud.com>
In-Reply-To: <f399749b-85bf-4aaf-8af6-ea735c5ab517@huaweicloud.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 9 Mar 2024 01:06:47 -0800
Message-ID: <CAOnJCULGctBu6viW7PwpT30o2fZ=aApi6UaJKsB4qjMEaEQ2cg@mail.gmail.com>
Subject: Re: [PATCH] drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while
 not supported
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_010704_903544_3A518BD0 
X-CRM114-Status: GOOD (  32.85  )
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

T24gRnJpLCBNYXIgOCwgMjAyNCBhdCAxMDo0OOKAr1BNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjAyNC8zLzggMTo1MiwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMDUsIDIwMjQgYXQgMDM6NTI6MjNQTSArMDAwMCwgUHUg
TGVodWkgd3JvdGU6Cj4gPj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPiA+
Pgo+ID4+IFJJU0MtViBwZXJmIGRvZXMgbm90IHlldCBzdXBwb3J0IGJyYW5jaCBzYW1wbGluZy4g
VHdvIHJpc2N2IGJwZgo+ID4+IHRlc3RjYXNlcyBnZXRfYnJhbmNoX3NuYXBzaG90IGFuZCBwZXJm
X2JyYW5jaGVzL3BlcmZfYnJhbmNoZXNfaHcgZmFpbGVkCj4gPj4gZHVlIHRvIG5vdCBkaXNhYmxp
bmcgc3VjaCBzYW1wbGluZy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4gPgo+ID4gVGhpcyBzZWVtcyB3b3J0aHkgb2YgYSBmaXhlcyB0YWcu
IEZvciB3aGF0IGNvbW1pdCBJIGRvIG5vdCBrbm93LCBidXQgSQo+ID4gZmlndXJlIGl0IGlzIGEg
cHJvYmxlbSBjdXJyZW50bHkgaW4gbWFpbmxpbmUgYW5kIGEgZml4IHNob3VsZCBiZQo+ID4gYmFj
a3BvcnRlZD8KPgo+IFRoYW5rcyBmb3IgcmV2aWV3LiBXZSBuZWVkIHRvIGJhbiB0aGlzIHR5cGUg
b2YgZXZlbnQsIG90aGVyd2lzZSB3ZSB3aWxsCj4gZ2V0IHVucHJlZGljdGFibGUgcmVzdWx0cy4g
SXQgc2hvdWxkIGJlIHdpdGggYSBmaXhlcyB0YWcuCj4KPiA+Cj4gPj4gLS0tCj4gPj4gICBkcml2
ZXJzL3BlcmYvcmlzY3ZfcG11LmMgfCA0ICsrKysKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11
LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKPiA+PiBpbmRleCBjNzhhNmZkNmM1N2YuLmJj
NDJjYjk1YTk3YyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKPiA+
PiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKPiA+PiBAQCAtMzEzLDYgKzMxMywxMCBA
QCBzdGF0aWMgaW50IHJpc2N2X3BtdV9ldmVudF9pbml0KHN0cnVjdCBwZXJmX2V2ZW50ICpldmVu
dCkKPiA+PiAgICAgIHU2NCBldmVudF9jb25maWcgPSAwOwo+ID4+ICAgICAgdWludDY0X3QgY21h
c2s7Cj4gPj4KPiA+PiArICAgIC8qIGRvZXMgbm90IHN1cHBvcnQgdGFrZW4gYnJhbmNoIHNhbXBs
aW5nICovCj4gPgo+ID4gU2tpbW1pbmcgcGF0Y2h3b3JrLCBJIGZvdW5kIHRoaXMgY29tbWVudCBj
b25mdXNpbmcuCj4gPiBJc29sYXRlZCBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSwgd2hpY2ggaXQg
d2lsbCBiZSBvbmNlIGNvbW1pdHRlZCwgaXQKPiA+IHdhcyBub3QgaW1tZWRpYXRlbHkgY2xlYXIg
dGhhdCB5b3Ugd2VyZSByZWZlcnJpbmcgdG8gdGhlIGRyaXZlci4gSSB0aGluawo+ID4gaXQgaXMg
anVzdCBtYXR0ZXIgb2YgbWFraW5nIHRoaXMgYSBjb21wbGV0ZSBzZW50ZW5jZSB0aGF0IHN0YXJ0
cyBieQo+ID4gbWVudGlvbmluZyAvd2hhdC8gZG9lcyBub3Qgc3VwcG9ydCB0aGlzIGZlYXR1cmUu
IElzIGl0IHRoZSBkcml2ZXI/IERvZXMKPiA+IHRoZSBzcGVjIG5vdCBhbGxvdyBpdD8gZXRjCj4K
PiBJIGFjdHVhbGx5IGp1c3QgZm91bmQgb3V0IHRoYXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24gb2YgcmlzY3YgcGVyZgo+IGRyaXZlciBkb2Vzbid0IHN1cHBvcnQgaXQuIEFmdGVyIHJlYWRp
bmcgdGhlIHJlbGV2YW50IHNwZWMsIEkgZGlkIG5vdAo+IGZpbmQgYW55IGRlc2NyaXB0aW9uIHJl
bGF0ZWQgdG8gYnJhbmNoIHJlY29yZC4gTWF5YmUgSSBtYXkgaGF2ZSBtaXNzZWQKPiBzb21ldGhp
bmcgb3IgaXQgbWF5IGJlIHN1cHBvcnRlZCBpbiB0aGUgZnV0dXJlLCBidXQgdGhlIGN1cnJlbnQg
ZHJpdmVyCj4gZG9lcyBub3Qgc3VwcG9ydCBpdCwgc28gSSB0aGluayBpdCBpcyBtb3JlIGFwcHJv
cHJpYXRlIHRvIGxpbWl0IHRoaXMKClllcy4gVGhlcmUgd2FzIG5vIHNwZWNpZmljYXRpb24gYXQg
dGhlIHRpbWUgdGhpcyBkcml2ZXIgd2FzIHVwc3RyZWFtZWQuClRoZSBzcGVjIGZvciBicmFuY2gg
cmVjb3JkIGJlaW5nIGlzIG9uIGl0cyB3YXkgZm9yIHJhdGlmaWNhdGlvbiBhbmQgcGF0Y2hlcwp3
aWxsIGJlIGF2YWlsYWJsZSBzb29uLgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtY29u
dHJvbC10cmFuc2Zlci1yZWNvcmRzCgpUaGUgY2hhbmdlcyBsb29rIGdvb2QgdG8gbWUgZm9yIG5v
dy4gSSB3aWxsIGJlIGhhcHB5IHRvIHNlbmQgYSBSQiB0YWcgb25jZSB5b3UKYWRkIHRoZSBGaXhl
cyB0YWcuCgo+IGNvbW1lbnQgdG8gdGhlIGRyaXZlciBpbXBsZW1lbnRhdGlvbi4gSG93IGFib3V0
ICJyaXNjdiBwZXJmIGRyaXZlciBkb2VzCj4gbm90IHN1cHBvcnQgYnJhbmNoIHN0YWNrIHNhbXBs
aW5nIj8KPgo+ID4KPiA+IENoZWVycywKPiA+IENvbm9yLgo+ID4KPiA+PiArICAgIGlmIChoYXNf
YnJhbmNoX3N0YWNrKGV2ZW50KSkKPiA+PiArICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+ID4+ICsKPiA+PiAgICAgIGh3Yy0+ZmxhZ3MgPSAwOwo+ID4+ICAgICAgbWFwcGVkX2V2ZW50
ID0gcnZwbXUtPmV2ZW50X21hcChldmVudCwgJmV2ZW50X2NvbmZpZyk7Cj4gPj4gICAgICBpZiAo
bWFwcGVkX2V2ZW50IDwgMCkgewo+ID4+IC0tCj4gPj4gMi4zNC4xCj4gPj4KPgoKCi0tIApSZWdh
cmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
