Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56C1C19777
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+afSdiy/zk8v5Suzmthimfvrf2nOQYexPP1ZeX6FBlE=; b=bgD4xW7T31lQ+2
	ybjwmDvJvvxBJjVTPRR5q2/qhpZ5VFjLlPliyusdHmcGybEyzTQ4JtD9nOUbCCQO0GEMhlpbrTKS8
	+hZ52J+La76x3i5R1HziSTysKCMrtPIraDgmC62eBuoD0N2jer1c75xzD5B5VpORdsu8Ho06fQFCG
	EMOnn9on6eYSWjbfx8Z1QJBVXoGmLeRbk0H5FwMjWAcABwAiBEZ06sNad7KEQKc8vVZHD0oVOxDUJ
	JU19vRvSGRqfHdvd/jAf+FVzq6CP/IxrihjqGHXMFfSUkn9D+/Y7e1kpFSiuBeQRfUDRoUyA2GNs/
	71NsiIkFPuRWw5EFD6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPC-00000003pb3-1UO1;
	Wed, 26 Feb 2025 13:24:54 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFJ9-00000003R0R-2jBe
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 11:10:32 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7272f9b4132so4458676a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 03:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740568227; x=1741173027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBMoR/ArodhoSoFeh7LaWi6Owi/0ZX4Wd5Am5SNNHF4=;
        b=aET0OnFcBXA3u1hQkmKSGgL0uC97TYMYzr3vYkC2O9giCRi/FCngxoQ9J8CqfNh8zN
         u4NZ9bKTAKeODgLSgGhZFibCGoLxTQsI6hgFPW/OlkjVltta+QkSEKAUK6WXYqxut1CD
         Ql3ZwTJs/wehExv80254RVdJq9u8dcPKdTg9cncj9Gbsu8il1y7qhyUPOnmyIBhwjCbY
         7Cqug/qq12BF2348tP3+TwnxsBzdeR6+8R9kBv2sTKBE0P3McMva4yZlOBwcPPL/j4/j
         9xD6w7ylQZtUOsQ9sy/9pc7ofO5arqcFaKa0Jg6mlwpLx6mZSJztyvN6U482a0rE3NhV
         P1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740568227; x=1741173027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBMoR/ArodhoSoFeh7LaWi6Owi/0ZX4Wd5Am5SNNHF4=;
        b=o9PEHT/qKmcHjQZA6c1Y2fS9Cwso8lDXlWcHxxn5qR7vKUdBO77IX7GkcBXRvlqJgc
         kIf6hEK84GVi/Ii/0vwrF9WLXrY4H2IV7wKxhf+czSv6me8kbxqplcS3ZvRzYp206Oxx
         VacqNrMFKWyVmLcCAOMgfcDvyvTcCws4L/K5i3PlUk0k+H+oYlW02wh8Dm59pH8mLEOk
         Qjvja4F+y+3Cl8lhFjraSRixXDYRlFnXHkS7HmfT1608wJw2ci33z9VycCAx0aZHp8CV
         QjlCgcfVTmkW1fJqLdutVcr8UvwXdAxkJjYoVii9N6NPl2lSQN06LNHwQ4OWVFn7H6t0
         O69w==
X-Forwarded-Encrypted: i=1; AJvYcCUsoA43UAsoEX5L9LeERuY/kBhThnhqB8PG8GQmBZgXB6b15zdRtdbVxFxidtkjHZt8eZXdcMByV6h2YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDXB1pwj8gM/kxQfSDh9O+gGR1pSEz4HayWM+6B5/+ahoVfhiK
	o42nIxY4iIkjPicmLzZziXbUmWScm2casC6L1YDL6/mjYSu6YjbwYOLUdp2A4eAyOJ1zt3DPVGM
	q30Wlt0+lYNm0BOJFo1hru3wWOMLPHprNDhb7cw==
X-Gm-Gg: ASbGncvuD98W2o3gxU3U+SxRDsUNQq45yB3JQGEDhhxUCqhLhiPPXjB8VqaWrApYHwj
	FXPjinjnESz3F9GULI1sKWzKtX9+DPtPAOgfjCKLIdWFEOaHSu6beky5+l5QgW4ic36fWBTfn38
	vk3p6L7BNP0g==
X-Google-Smtp-Source: AGHT+IFY+L/f4Zs9pF53F2VadmOaBwoDscmttE66sKkMkDrENSfkvd4Uv+2+QT/1Y3Me6cp5dQ64I9SS9F3F4i971AM=
X-Received: by 2002:a05:6808:124b:b0:3f4:1fd2:1bac with SMTP id
 5614622812f47-3f547e08930mr1518804b6e.20.1740568226922; Wed, 26 Feb 2025
 03:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
 <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com> <CAHVXubhCOivB8oxG7gcCNKTfK0DgHdu721SxsyGX2E4XAjbi6w@mail.gmail.com>
In-Reply-To: <CAHVXubhCOivB8oxG7gcCNKTfK0DgHdu721SxsyGX2E4XAjbi6w@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 26 Feb 2025 19:10:16 +0800
X-Gm-Features: AQ5f1JqM3klrVlTfvA2HKaStjUgmmSxXZxwlOv1ogVvdE4509n751aKn9XVYGRs
Message-ID: <CAEEQ3wnu11zS+C8xfF0-gk0S5Ck-W4Ep8DuqEU-kvgsX_DTSug@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 0/3] Enable Zicbom in usermode
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: ajones@ventanamicro.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_031031_692617_F8758FF8 
X-CRM114-Status: GOOD (  25.68  )
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

SGkgQWxleCwKCk9uIFR1ZSwgRmViIDI1LCAyMDI1IGF0IDEwOjA34oCvUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDI1LCAy
MDI1IGF0IDI6MjfigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gSGkgQWxleCwKPiA+Cj4gPiBPbiBUdWUsIEZlYiAyNSwgMjAyNSBhdCA5OjIx
4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gSGkgWXVuaHVpLAo+ID4gPgo+ID4gPiBPbiBXZWQsIEphbiAxNSwgMjAyNSBhdCAz
OjQw4oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gdjEvdjI6Cj4gPiA+ID4gVGhlcmUgaXMgb25seSB0aGUgZmlyc3QgcGF0Y2g6
IFJJU0MtVjogRW5hYmxlIGNiby5jbGVhbi9mbHVzaCBpbiB1c2VybW9kZSwKPiA+ID4gPiB3aGlj
aCBtYWlubHkgcmVtb3ZlcyB0aGUgZW5hYmxpbmcgb2YgY2JvLmludmFsIGluIHVzZXIgbW9kZS4K
PiA+ID4gPgo+ID4gPiA+IHYzOgo+ID4gPiA+IEFkZCB0aGUgZnVuY3Rpb25hbGl0eSBvZiBFeHBv
c2UgWmljYm9tIGFuZCBzZWxmdGVzdHMgZm9yIFppY2JvbS4KPiA+ID4gPgo+ID4gPiA+IHY0Ogo+
ID4gPiA+IE1vZGlmeSB0aGUgb3JkZXIgb2YgbWFjcm9zLCBUaGUgdGVzdF9ub19jYm9faW52YWwg
ZnVuY3Rpb24gaXMgYWRkZWQKPiA+ID4gPiBzZXBhcmF0ZWx5Lgo+ID4gPiA+Cj4gPiA+ID4gdjU6
Cj4gPiA+ID4gMS4gTW9kaWZ5IHRoZSBvcmRlciBvZiBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT01f
QkxPQ0tfU0laRSBpbiBod3Byb2JlLnJzdAo+ID4gPiA+IDIuICJURVNUX05PX1pJQ0JPSU5WQUwi
IC0+ICJURVNUX05PX0NCT19JTlZBTCIKPiA+ID4gPgo+ID4gPiA+IFl1bmh1aSBDdWkgKDMpOgo+
ID4gPiA+ICAgUklTQy1WOiBFbmFibGUgY2JvLmNsZWFuL2ZsdXNoIGluIHVzZXJtb2RlCj4gPiA+
ID4gICBSSVNDLVY6IGh3cHJvYmU6IEV4cG9zZSBaaWNib20gZXh0ZW5zaW9uIGFuZCBpdHMgYmxv
Y2sgc2l6ZQo+ID4gPiA+ICAgUklTQy1WOiBzZWxmdGVzdHM6IEFkZCBURVNUX1pJQ0JPTSBpbnRv
IENCTyB0ZXN0cwo+ID4gPiA+Cj4gPiA+ID4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdCAgICAgICAgfCAgNiArKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
cHJvYmUuaCAgICAgICAgICAgIHwgIDIgKy0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCAgICAgICB8ICAyICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jICAgICAgICAgICAgICB8ICA4ICsrKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgIHwgIDYgKysKPiA+ID4gPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9jYm8uYyB8IDY2ICsrKysrKysrKysrKysrKysr
LS0tLQo+ID4gPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjM5LjIKPiA+ID4gPgo+ID4gPgo+
ID4gPiBTbyBhIHY2IG5lZWRzIHRvIGJlIHNlbnQgd2l0aDoKPiA+ID4KPiA+ID4gLSB0aGUgZml4
IGZvciBod3Byb2JlX2V4dDBfaGFzKCkgcmVwb3J0ZWQgYnkga2VybmVsIHRlc3Qgcm9ib3QKPiA+
ID4gLSBhIHJlYmFzZSBvbiB0b3Agb2YgNi4xNCBzaW5jZSBwYXRjaCAyIHdpbGwgY29uZmxpY3Qg
d2l0aAo+ID4gPiBSSVNDVl9IV1BST0JFX0tFWV9WRU5ET1JfRVhUX1RIRUFEXzAKPiA+Cj4gPiBU
aGFuayB5b3UgZm9yIHRoZSByZW1pbmRlci4gSW4gZmFjdCwgdmVyc2lvbiA2IHdhcyBzZW50IG91
dCBhbG1vc3QgYQo+ID4gbW9udGggYWdvLiBSZWZlcmVuY2U6Cj4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjUwMTI0MDM1OTU5LjQ1NDk5LTEtY3VpeXVuaHVpQGJ5dGVkYW5jZS5j
b20vCj4KPiBPaCBzb3JyeSwgSSBtaXNzZWQgaXQgc29tZWhvdyEKPgo+IEkgdGhpbmsgd2UgY2Fu
IGZpeCBSSVNDVl9IV1BST0JFX01BWF9LRVkgd2hlbiBtZXJnaW5nIHRoZSBwYXRjaC4KPgo+IFNv
cnJ5IGFnYWluIGFuZCB0aGFua3MhCgpJdCdzIGFsbCBnb29kLiBJJ3ZlIHJlYmFzZWQgYSB2ZXJz
aW9uOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAyMjYwNjMyMDYuNzEyMTYtMS1j
dWl5dW5odWlAYnl0ZWRhbmNlLmNvbS8uCkNvdWxkIHlvdSBoZWxwIHRvIG1lcmdlIGl0PyBUaGFu
a3MuCgoKPgo+IEFsZXgKPgo+ID4KPiA+ID4KPiA+ID4gRG8geW91IHRoaW5rIHlvdSBjYW4gZG8g
dGhhdCBzb29uIHNvIHRoYXQgaXQgZ2V0cyBtZXJnZWQgaW4gNi4xNT8gVGhlCj4gPiA+IHBhdGNo
c2V0IHJlY2VpdmVkIGEgbG90IG9mIFJCIHNvIGl0IHdvdWxkIGJlIHRvbyBiYWQgdG8gbWlzcyB0
aGlzCj4gPiA+IHJlbGVhc2UuCj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4KPiA+ID4gQWxleAo+
ID4KPiA+IFRoYW5rcywKPiA+IFl1bmh1aQoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
