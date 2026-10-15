Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B3CC6B38
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQs6I2Cte55+GKM/t90lxU152cfiDOgFr9zPFRPOXYQ=; b=IiZ8he/6NLaO1t
	CQIaI13K0DwZoJB41XKGzK2QeN0K5NG/fsU9+RI6e9XSbmDEZJVlh+YS6oajL02/L6Wf3ZslI2k9T
	Ght+NCvi8cjc51UbWJOkFxNQ1SDJOO6HvzewUZ+ksOzitDRUSrJS0jMvHhH0hOqwdsIPv/CM8G+VE
	spSygWKn8ehXcv20BrbXVPcPAHclnV5y9V1T7lWn2VohTlfSOtNpbR2N3ci3SxadRXQtD2oRkX3Nz
	8DPfXAW4hBye05rme9wOQIH3fuKgcs5mfPw4GqIy4UYA6y9B+EvnkZi0+UUB52teofdxhiv4cM84N
	y+oIfvlY4sX8tZTcdAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPN6-000000010pA-3iww;
	Thu, 15 Oct 2026 17:36:04 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPN3-000000010nE-2ZXV
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 17:36:02 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8ab3d3c5761so47128137b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 10:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085760; cv=none;
        d=google.com; s=arc-20260327;
        b=EHjUcbXBoJ5d+cfyq2iv5rzbMlu1B2V5+B+8nyvf+/p574ZjqPKsIMB/qybP86wVW9
         +SAEqfvAs/kDYb5WuIB6JHUSlnACF8rHRxwNWXickKzm9P4IJ0cCfsoo0O+N2VwplM7D
         X6mSdC4uUopGnyWZwRGd3spOyMVTvW46/sbLeeA+3fP2tmimLxrVTYH68pPfS8u/hsjg
         Glz/FckwaCwzaqeL+6ZknpfOMn+LSsSZrN4hbvXFustT4xmClXvfn9v2wxcGWn2PBAJQ
         4RbQR6NRzu0RWGnqjhm3H1JMtwwcb19LnHJhmwE8G2+mGIdczhCJyxmIEe33SWOhTOhU
         s2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dm9d8Wo7phCvR235TygduRlnGSKE1I/4rDerIX3YHQA=;
        fh=phm4s1hlLWpmEiAaY+LOxvtU86/8XcITosIlNNwCbgE=;
        b=O8nH0GvBk8ctCeHaHZ/HRyzPfuN6+LiiXADVFL50osN1AMAhySUmyUMOD9b9sB1Mqm
         UMVHyTmKRZwhhSkm5QJXkX8tx7bGYSEel0uSQOa5bOKZwdqfr6WQ2sV8Cv/vKoAv7DE3
         ev1MWvACLs6QykCkaHR41O9GtSVnGNsVBAt+RsffHQDyAIMxme4g7jmy916uv0fKL6LT
         iQ+3FlS4sUlAcTyAc/dq2U2mvXPrgVmSfyKEmHQ4OqKv2H3d7pkGAcYxnErXghIOVbm5
         iQ04J2EYLCHJ2csXmFDxVEGhh/W7DcKWa27MK+i0AkXfgEngwBcOgBgIxbylCDU9OiX3
         zTmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085760; x=1792690560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dm9d8Wo7phCvR235TygduRlnGSKE1I/4rDerIX3YHQA=;
        b=AFWnmImQFNiHoW56EAlFGM4r5IZeJ/rAAXhr0bK4jU4tB/TEhzJE9wvaRPeUK0RxE9
         FVDyKSsw8RxNDEAP8ExPAqaN540naoxT52YSTBGVlGgBq7Z8shrT1R9Ru3yuvnvDChlj
         sY8f2fxGAvv9UH5M/anSYWoeMP7Uzze7RsD/ECdalJUhEiuDse9cP6XXWzdNEH5OjYaZ
         jYcElT45I4cmH2AKnId2YDINMUjl4/LqC+pVHzaKFv83EYDu83T+OTtZ16RPylZHp+Cs
         7fi81qqAwdE/URzOYQczK1+47o6tf0fKl22n/MIpLvC1sghGQsp5Z1ohahIh0vx8Fb1v
         a8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085760; x=1792690560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm9d8Wo7phCvR235TygduRlnGSKE1I/4rDerIX3YHQA=;
        b=Jmnn1JoyLfYJ3uPlsZTI3KrswT1fBki5ZAES/v1ScokMzf1Sema2rs/bOtkrVfHo0y
         NoXMg0gd3/nHbyR1WmISoGrimMpta8bOfUANejW2qSUaJHL8LIL2HZ9S2H67RQAAlG/9
         f8UQTlnwV4ZWpSZD6ApMfxE0PwpWxIvrWO1ehyXGAHG2ztLsilkUCO1xap/JYkIpSx56
         qKj+YCKYrb6su2gTKAYvz1i12qDfk32RLW29gwCLV+QxTPSQjx7Mikq4z9Ake8Lq1PYE
         O+oByWaFoSfdcxrHkiEe6Z9Lqdgk82DabwhX5hSLsJM3Mvd0dKNxadi2/Bar8mzT+hWY
         mUdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp9n5qEoyQDK9E9bM9GzMQhym67KDvoxq6Z7KWTH2arU/mOwygkZ5iYAI5lxGrmR6FXDVzfQfFQcwYig==@lists.infradead.org
X-Gm-Message-State: AFq9FYJD9ZnnSwld2cSm8iaLflGemB9NBf8rrEEEY+41oC/8gDA9LM8N
	+KY7DMkJ/u36kPb6+20nIJqw/6DoRJPWXI7RhZQwVvdbgSTwT8dibA5A1s+sQBK9pT47S7AQcX0
	jiP/wMGtcXYxbjov7oVsvOfTJhYZUA4c=
X-Gm-Gg: AYBFou1FSwJoi9D1H+TVoV6LVfpx1+1ZUJS5Cp/E3g1LB6i8v6V+V2IgwA/bT/nl+lt
	8cudQia77CBgqeoCFMDlNa66aZ62HJ5FQFxqGk5YTjkm4x8v5MXryaamx/GbiI5NYoMN6g7lvWP
	I0nJy27ylNLsb3YyQV5+9T0sFQzHUiSYUfCblKy3fsYuDvg2yb5NJasdaE4s4d+H6P5+0s7zOdx
	xN6Ly0oUFkvReMpjYuK0t3aq6wtpC8PfjAewiPFz4OcMP3aTFhG8YD6Q/bY4LzqBsh/GGfBrx7d
	+u61YTbnGxHesF2bm+rp9K9keANBmyOpkGBBnPeZPLWEJQyJAmFN9Uo=
X-Received: by 2002:a05:690c:e3cd:b0:8b0:dc4d:941d with SMTP id
 00721157ae682-8b0dc4d98f3mr6640397b3.37.1792085760499; Thu, 15 Oct 2026
 10:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <ar_Rathmoj2aP-H7@xhacker> <CALsPMBOYQbro2gZTQR=DSUowmVDs9kujH4ua2UzCoHAQrncuiw@mail.gmail.com>
 <asm95GdbmMpc81p3@xhacker> <CALsPMBPMHc7q-YZvqLLYDSr5RfLmDRwBSq-TFeB8Fc8bPBjQGg@mail.gmail.com>
 <as8NpaT0g9Tsl6PS@xhacker> <CALsPMBOdy4ZDWfnkYokUFuB3UYPV27wTUpBCZaxLWEV10ZuS=A@mail.gmail.com>
 <atAROTefufggiFPO@xhacker> <atBWGQ2iWpm2VKcY@xhacker> <CALsPMBPNKsnSAczyVm3LFFQjwRg8eiGgpB2hJN19iipRZ0mASA@mail.gmail.com>
In-Reply-To: <CALsPMBPNKsnSAczyVm3LFFQjwRg8eiGgpB2hJN19iipRZ0mASA@mail.gmail.com>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Thu, 15 Oct 2026 19:35:49 +0200
X-Gm-Features: AclHuK-wBT1gio8L_jkhM1aKzScEpjwEXurLQrG7VqNt3Zx9orkwjzcjHQwTcig
Message-ID: <CALsPMBOfqDuCqCdODvJc05CFVda5pMsixOOTXyvjyDO2=DnWYw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_103601_665485_A672C52C 
X-CRM114-Status: GOOD (  22.76  )
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

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgNzowOOKAr1BNIFJvbWFuIFN0b3JvemhlbmtvCjxyb21l
dXNtZWlzdGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxNSwgMjAyNiBhdCA2
OjQ34oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4g
PiBPbiBUaHUsIE9jdCAxNSwgMjAyNiBhdCAwNzozMzoxM0FNICswODAwLCBKaXNoZW5nIFpoYW5n
IHdyb3RlOgo+ID4gPiBPbiBXZWQsIE9jdCAxNCwgMjAyNiBhdCAwNTo1ODo0MlBNICswMjAwLCBS
b21hbiBTdG9yb3poZW5rbyB3cm90ZToKPiA+ID4gSSB0aGluayB5b3UgbWlzdW5kZXJzdG9vZCBz
b21ldGhpbmcuIEEgcmlzY3YgcGxhdGZvcm0gdXNlcyBlaXRoZXIKPiA+ID4gU0JJIFJGRU5DRSBv
ciBJUEkgZm9yIHRsYiBzaG9vdGRvd24sIGFuZCB3b24ndCBjaGFuZ2UuIFNvIHlvdSBjYW4KPiA+
ID4ga25vdyB3aGV0aGVyIHRoZSBzeXN0ZW0gaXMgU0JJIFJGRU5DRSBwb3dlcmVkIG9yIElQSSBw
b3dlcmVkIGJ5Cj4gPiA+IGNhdCAvcHJvYy9pbnRlcnJ1cHRzLiBJdCdzIG11Y2ggc2ltcGxlci4K
PiA+Cj4gPiBBaGEsIEkgbWlzc2VkIGFjbGludCBzc3dpIGNhc2UsIGlmIHNzd2ksIG5vIGV4cGxp
Y3QgL3Byb2MvaW50ZXJydXB0cwo+ID4gZGlmZmVyZW5jZSBiZXR3ZWVuIHNzd2kgYW5kIHRyYWRp
dG9uYWwgcGxpYy4gSG93ZXZlciwgd2hldGhlciBUTEIgaXMKPiA+IHBvd2VyZWQgYnkgU0JJIFJG
RU5DRSBvciBJUEkgY2FuIHN0aWxsIGJlIGtub3duIGJ5IGNoZWNraW5nCj4gPiAicHJvdmlkaW5n
IElQSXMgdXNpbmcgU0JJIElQSSBleHRlbnNpb24iIGluIGRtZXNnLgo+Cj4gVGhhbmtzLCBJIHNl
ZSB5b3VyIHBvaW50IG5vdy4KPgo+IEkgd2FzIHRyZWF0aW5nIFNCSSBSRkVOQ0UgdnMgdGhlIExp
bnV4IGNyb3NzLUNQVSBwYXRoIGFzIHBhcnQgb2YgdGhlCj4gcGVyLXJlcXVlc3Qgc2VsZWN0aW9u
LCBidXQgd2l0aCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbgo+IHJpc2N2X3NiaV9mb3JfcmZl
bmNlIGlzIGVmZmVjdGl2ZWx5IGEgc3lzdGVtLXdpZGUgY2hvaWNlIGVzdGFibGlzaGVkCj4gZHVy
aW5nIGluaXRpYWxpemF0aW9uLgo+Cj4gSSByZXdvcmtlZCB0aGUgcGF0Y2ggaW4gdjMgYmFzZWQg
b24geW91ciBmZWVkYmFjay4gVGhlIHRyYWNlcG9pbnQgbm8KPiBsb25nZXIgcmVwb3J0cyB0aGUg
bG9jYWwvU0JJIFJGRU5DRS9jcm9zcy1DUFUgaW1wbGVtZW50YXRpb24gcGF0aC4KPiBJbnN0ZWFk
LCBpdCBkZXNjcmliZXMgdGhlIHNlbWFudGljIFRMQiBpbnZhbGlkYXRpb24gcmVxdWVzdCBpdHNl
bGYsCj4gaW5jbHVkaW5nIHRoZSByYW5nZSwgc3RyaWRlLCBBU0lELCB0YXJnZXQgQ1BVIG1hc2sg
YW5kIHJlcXVlc3Qgc2NvcGUuCj4KPiBJIHN0aWxsIHRoaW5rIHRoZXJlIGlzIHZhbHVlIGluIGV4
cG9zaW5nIHRoaXMgaW5mb3JtYXRpb24gYXMgb25lCj4gc2VtYW50aWMgZXZlbnQuIFRoZSBpbmRp
dmlkdWFsIHBpZWNlcyBjYW4gYmUgcmVjb25zdHJ1Y3RlZCB3aXRoIGR5bmFtaWMKPiB0cmFjaW5n
LCBidXQgaGF2aW5nIHRoZW0gdG9nZXRoZXIgbWFrZXMgaXQgc3RyYWlnaHRmb3J3YXJkIHRvIGFu
YWx5emUKPiB0aGUgZGlzdHJpYnV0aW9uIGFuZCBjaGFyYWN0ZXJpc3RpY3Mgb2YgVExCIGludmFs
aWRhdGlvbnMgYWNyb3NzIGEKPiB3b3JrbG9hZCB3aXRob3V0IGRlcGVuZGluZyBvbiB0aGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzLgo+Cj4gVGhlIHYzIHBhdGNoIGlzIGhlcmU6Cj4K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMTUtdGxiX3RyYWNlcG9pbnQtdjMt
MS1lZWYzMDVhM2JiNjNAZ21haWwuY29tLwo+Cj4gVGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhl
IGRpc3RpbmN0aW9uLiBJdCBoZWxwZWQgc2ltcGxpZnkgdGhlIGV2ZW50Cj4gYW5kIG1ha2UgaXRz
IGFic3RyYWN0aW9uIGNsZWFyZXIuCgpBbmQgcXVpY2sgdjQsIHdoZXJlIEkgcmVtb3ZlZCB1bm5l
Y2Vzc2FyeSBjbGVhbmluZyBmb3IgY2hlY2twYXRjaDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYxMDE1LXRsYl90cmFjZXBvaW50LXY0LTEtZjIzOGEyYmQ4ZjdlQGdtYWlsLmNvbS8K
Cj4KPiAtLQo+IEtpbmQgcmVnYXJkcywKPiBSb21hbiAnSGVkaW4nIFN0b3JvemhlbmtvCgoKCi0t
IApLaW5kIHJlZ2FyZHMsClJvbWFuICdIZWRpbicgU3Rvcm96aGVua28KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
