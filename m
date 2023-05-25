Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C2C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rW7phY9wbmGEGgzJWWoB9t0aBulipyq7Z+qDkQWCko=; b=h2Z5sHPKTBjQZn
	AoeDgkvLojFS4blW6aC/cN2EhTq3xCTPneveRYB4uqcLQZdajWfmqWjUe4rbWBVU4EuOjl6hp4sVL
	xEsxAM7b+9mefNwHI5QzZZT02USxC0PsdD1wj1WPhKiSB51O30YC9UgU8/Bux+egCHtzYw+GfjgzL
	cWVxHfF0u9QlZWRz+dLrDo7hDkHrzf334ss30RuKGuAnFgtYXeXS7q7tYTlF3/2sV9Jn6ueNV9NtV
	O474/+lW8em5YTFnSh6ft5cAf2k1jrVh+RjKW/Wjc45FyruH5wjAXeQ3roUx5BinERT70+1AhPZq5
	/VLWU7fGqKn0+xNeWdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BVd-00Gmro-1K;
	Thu, 25 May 2023 14:00:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BVa-00Gmq4-13
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 14:00:03 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96fdc081cb3so101627966b.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1685023198; x=1687615198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPrIK19LKsIekBL7Exksia/ZXnGLEugBzMWwwv5N8PY=;
        b=wNs1Dd0fiUT91Vm7v3vikIO0L1KvCJsboGzq0ADBHCcoGPEZ4zpEwIlq2IhdnByCXf
         kW2WUhlIKMZfmrsNqXKAj6AMmZ+8iepaAWzdRJZ/MOp78LOEyFwYN84kDdGs23JIG9++
         6Pn+2/ts1wzfGKG8uV6q+a43VlyjLwzs2JgUckVji0vbjIbKn/VrsQSl6OEw9EkJLGk6
         3c+viiBEJz5lBBVoXe/NvrXyiWPFZd253iqON2EmnwVqFRENvzCktcXaEUZamxXK6n5F
         J3Un2kC+khnAyKESeVqOxn001SL41oivn/U4NOwQ98sMfgUAF3sBVEMk9OBdNBYkIpZU
         TFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685023198; x=1687615198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPrIK19LKsIekBL7Exksia/ZXnGLEugBzMWwwv5N8PY=;
        b=KWGKNatbsvBES7hRYJ6mm5VU177SieQspaJvLM8fMvQclMSwsni7BHbHhyUtQ1rFQk
         azYGHTMLzYMEITsA2a0U5frmo/o4uHL95nCHw/44wBUrrF71DbAlJMUetq0kLbVq+981
         1++58pCw70l+l7bvE7nc6lxYDKkDzBwG4Co43as6pk2NkO+BDHp3E643UxAoBKdgUrrc
         yMp62jVZOWcwro90WuY8hknAQ2/QWGWA/vFGQVNBlKSTbQNMjdL1VSvn1XY3TAyeJg1f
         dur2UKbhPszUxGv64uld3gSWlUUfsawx4mOXL/jBZ4z6iRjLiZ9R3o3WroE4fRpHXxF/
         sntw==
X-Gm-Message-State: AC+VfDx8zzLT6htHMsBCBJmeOsT6kT+hQmUskNXArIljyhXTVAL3jNrU
	3TP9C+kib2ZAdb1E6ge3nwRt8PdRej/vNhJXzEjUOg==
X-Google-Smtp-Source: ACHHUZ7lf7ik+P2YwcQcVNg1huYeLbeYnW5Lw15SXlyDhIMtug3qin18sNXDOjx/aNLoN0GoixYAkLROtI4uNjlZhXw=
X-Received: by 2002:a17:906:5d13:b0:96f:893:7f5 with SMTP id
 g19-20020a1709065d1300b0096f089307f5mr2182403ejt.26.1685023198318; Thu, 25
 May 2023 06:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230517-preacher-primer-f41020b3376a@wendy> <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr> <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
 <20230525-guacamole-swimmer-68048a73baac@wendy> <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy> <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy>
In-Reply-To: <20230525-shrapnel-precut-26500fca4a48@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 25 May 2023 19:29:46 +0530
Message-ID: <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, 
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_070002_381347_2528EA0F 
X-CRM114-Status: GOOD (  28.32  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgNzoyNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDc6
MTM6MTFQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDI1LCAyMDIz
IGF0IDc6MDjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDY6NTE6MjhQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4KPiA+ID4gPiA+IFdlIHNob3VsZCBvbmx5IHJlbHkg
b24gdGhpcyBub2RlIG5hbWUgZm9yIGtub3duIGJhZCB2ZXJzaW9ucyBvZiBvcGVuc2JpCj4gPiA+
ID4gPiBJTU8uIEdvaW5nIGZvcndhcmQsIGlmIHNvbWV0aGluZyBuZWVkcyB0byBiZSByZXNlcnZl
ZCBmb3IgZmlybXdhcmUsIHRoZQo+ID4gPiA+ID4gZmlybXdhcmUgc2hvdWxkIG1ha2Ugc3VyZSB0
aGF0IGl0IGlzIHJlc2VydmVkIGJ5IHVzaW5nIHRoZSBwcm9wZXJ0eSBmb3IKPiA+ID4gPiA+IHRo
YXQgcHVycG9zZSA6KQo+ID4gPgo+ID4gPiA+IFRoZXJlIGlzIG5vIGlzc3VlIHdpdGggT3BlblNC
SSBzaW5jZSBpdCBkb2VzIHRoZSByaWdodCB0aGluZyBieSBtYXJraW5nCj4gPiA+ID4gbWVtb3J5
IGFzIHJlc2VydmVkIGluIHRoZSBEVC4gVGhpcyByZWFsIGlzc3VlIGlzIHdpdGggdGhlIGtlcm5l
bCBoYW5kbGluZwo+ID4gPiA+IG9mIHJlc2VydmVkIG1lbW9yeSBmb3IgaGliZXJuYXRlLgo+ID4g
Pgo+ID4gPiBJIGRvbid0IHRoaW5rIHdlIGFyZSB0YWxraW5nIGFib3V0IHRoZSBzYW1lIHRoaW5n
IGhlcmUuIEkgbWVhbnQgdGhlCj4gPiA+IG5vLW1hcCBwcm9wZXJ0eSB3aGljaCBPcGVuU0JJIGRv
ZXMgbm90IHNldC4KPiA+Cj4gPiBZZXMsIHdlIGFyZSB0YWxraW5nIGFib3V0IHRoZSBzYW1lIHRo
aW5nLiBJdCdzIG5vdCBqdXN0IE9wZW5TQkkgbm90Cj4gPiBzZXR0aW5nIG5vLW1hcCBwcm9wZXJ0
eSBpbiByZXNlcnZlZCBtZW1vcnkgbm9kZSBiZWNhdXNlIG90aGVyCj4gPiBTQkkgaW1wbGVtZW50
YXRpb25zIHdvdWxkIGJlIGRvaW5nIHRoZSBzYW1lIHRoaW5nIChpLmUuIG5vdCBzZXR0aW5nCj4g
PiBuby1tYXAgcHJvcGVydHkpCj4KPiBPdGhlciBTQkkgaW1wbGVtZW50YXRpb25zIGRvaW5nIHRo
ZSBzYW1lIHRoaW5nIGRvZXNuJ3QgbWFrZSBpdCBhbnkgbW9yZQo+IGNvcnJlY3QgdGhvdWdoLCBy
aWdodD8KCkxpa2UgbXVsdGlwbGUgZm9sa3Mgc3VnZ2VzdGVkLCB3ZSBuZWVkIERUIGJpbmRpbmcg
Zm9yIGRpc3Rpbmd1aXNoaW5nCmZpcm13YXJlIHJlc2VydmVkIG1lbW9yeSBmcm9tIG90aGVyIHJl
c2VydmVkIG1lbW9yeS4gVW50aWwgdGhhdApoYXBwZW5zIHdlIHNob3VsZCBlaXRoZXIgbWFyayBo
aWJlcm5hdGUgc3VwcG9ydCBhcyBleHBlcmltZW50YWwKb3IgcmV2ZXJ0IGl0LgoKUmVnYXJkcywK
QW51cAoKPgo+ID4gPiA+IExpa2UgQXRpc2ggbWVudGlvbmVkLCBub3QganVzdCBPcGVuU0JJLCB0
aGVyZSB3aWxsIGJlIG90aGVyIGVudGl0aWVzCj4gPiA+ID4gKGxpa2UgVFNNKSBvciBzb21lIG90
aGVyIE0tbW9kZSBmaXJtd2FyZSB3aGljaCB3aWxsIGFsc28gcmVzZXJ2ZQo+ID4gPiA+IG1lbW9y
eSBpbiBEVC9BQ1BJIHNvIGNsZWFybHkga2VybmVsIG5lZWRzIGEgU0JJIGltcGxlbWVudGF0aW9u
Cj4gPiA+ID4gaW5kZXBlbmRlbnQgd2F5IG9mIGhhbmRsaW5nIHJlc2VydmVkIG1lbW9yeSBmb3Ig
aGliZXJuYXRlLgo+ID4gPgo+ID4gPiA+ID4gPiBBbm90aGVyIG9wdGlvbiBpcyB0byB1c2UgY29t
cGF0aWJsZSBzdHJpbmcgb3IgbGFiZWwgcHJvcGVydHkgdG8gaW5kaWNhdGUKPiA+ID4gPiA+ID4g
dGhhdCB0aGlzIG1lbW9yeSByZWdpb24gaXMgbm90IHRvIGJlIHNhdmVkL3Jlc3RvcmVkIGR1cmlu
ZyBoaWJlcm5hdGlvbi4KPiA+ID4gPiA+ID4gVGhpcyBjYW4gYmUgZG9jdW1lbnRlZCBpbiBSSVND
LVYgRFQgYmluZGluZ3MgYXMgd2VsbCBhcyB0aGUgYm9vdGluZyBndWlkZQo+ID4gPiA+ID4gPiBk
b2MgdGhhdCBhbGV4IHdhcyB0YWxraW5nIGFib3V0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFN1cmUs
IGEgZHQtYmluZGluZyBmb3Igc2JpIHJlc2VydmVkIHJlZ2lvbnMgZG9lc24ndCBpbW1lZGlhdGVs
eSBzb3VuZAo+ID4gPiA+ID4gbGlrZSBhbiBhd2Z1bCBpZGVhLi4uIEJ1dCB3ZSBzdGlsbCBoYXZl
IHRvIHdvcmsgYXJvdW5kIHRoZSBib3JrZWQKPiA+ID4gPiA+IGZpcm13YXJlIC0gYmUgdGhhdCBk
aXNhYmxpbmcgaGliZXJuYXRpb24gb3IgdXNpbmcgdGhlIG1tb2RlX3Jlc3Ygbm9kZQo+ID4gPiA+
ID4gd2hlbiB3ZSBrbm93IHRoYXQgdGhlIHZlcnNpb24gb2YgT3BlblNCSSBpcyBvbmUgb2YgdGhv
c2Ugd2l0aCB0aGUKPiA+ID4gPiA+IHByb2JsZW0uCj4gPiA+Cj4gPiA+IERpZCB5b3Ugc2tpcCBv
dmVyIHRoaXM/IEkgd2FzIGFncmVlaW5nIHRoYXQgZGVmaW5pbmcgYSBjb21tb24gYmluZGluZyBm
b3IKPiA+ID4gc2JpIHJlc2VydmVkIHJlZ2lvbnMgd2FzIGEgZ29vZCBpZGVhLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
