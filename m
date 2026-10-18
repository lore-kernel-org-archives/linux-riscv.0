Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69090CCF2C9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8MDLfreg5lnSwNlsua5hlzfmGD3GXSHovMD5uNmS4I=; b=w2knF1WGdanooH
	ZqlTrI4YDmYoTUlijS/GAeaaCLrMn3tol/TZ2XuuwZqcamJSUWGST9YhC5sUWKTFC+dFEDWXWutqb
	4DtANY5dFlK+KCCLUF/Dri9SX8xecEEsXwqGqN7Xrl2UHDL6Mk91I1xUiQkaM+kCxJ9LgLglO2JIU
	9Z4lHbwv4XfsMgQAx3nwDJV1+wO2/Wji0AG4WB8ROyU1FbJ/Zsct0xf664jegtY7NQQFHzUeJM2cH
	5rE45V98oZLUdbLuVP4a/wqmnuUExDGiy4Qvw5RbrqVuGxDosKbii6G8skYaRXElBFxBAWZVZVYmd
	mbvkcmSR+RcE4Sa770cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOxW-00000005nDS-2IVM;
	Sun, 18 Oct 2026 11:21:46 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOxS-00000005nD3-0jdW
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 11:21:43 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6774639a8a4so943553d50.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Oct 2026 04:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792322500; cv=none;
        d=google.com; s=arc-20260327;
        b=W7BERx0iTzVfQlJ/HxKRCGwCDBcnuqTM+blBiWPLYK1dwf+gF7Ls09MwEyr+niNq9W
         tDB5JVR8SWo0IYy88rRgoE3nxaOIZns9/q074IWRqYRKsOQ95srrsD7j2gdO4HRfzIFI
         52eCtUcQizKYl25cTZmkYM0juukWPNz+RMldK9Z0u9wl5VFxOu7eJmCIR8ICMEz0MB3F
         LbCHIQfHDkJ2K7eMjPDCf5BaLJPnf0Q5UiiKNJNyzxamtKw7BsTm0ob2cQ9SUACdHPQ1
         WVQprMjEm07vAMqUJ4cdIg7seRPbUzQQxAHvx2RIhonIexOtUhNZdzycZIqbJt7BFne3
         m8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6HVJA1CilQEoae2ePMD3zaqAFtAvSpqKqWYCEyEwCOg=;
        fh=AQSAM0DiojndrPEDcyUDy+IVftQBXju0BMYDu0Svw5Q=;
        b=QfJF+BtjzA8PgWv/acpyOOCR/hkhsBVpMhNJp+QHm/sXCLX8aSety/7psR71tZuzmn
         Crhix/N7dyGbEcb1+rU9vA9Uj6qxUywdrm0/YAv6zXZ5INDUa2mSuB0K5o4YWJ4/vG7i
         jJ6QZzyvltRWf/vt4PoLxEM6TQm1r4C2fsTadku+tL3eZn7x2/gjeFdAUaO2icARBud/
         SF9Y8c1D+emSmSYHxDrzkcymYLt0noFeNoZ5Z8jNjDKwtXuiExkNxE4U+97yFKsAexsS
         JgTa1RiLSlCuQlzMLv5d6gVgF0TtCRjp/tKy+DixpRyVSm+A5ZE/UJA0N7k9F1j3sUBG
         TnAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322500; x=1792927300; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6HVJA1CilQEoae2ePMD3zaqAFtAvSpqKqWYCEyEwCOg=;
        b=EmMUiFbnjpirYhT7rau1QewR4r+0FmlT8Kyirp6hSUNLBHi4FR2F4TD2jIzRMKvZaA
         AxABvRsYdUNxjnS6Z9yi2gijau+avrgCf7jA431C9z+FmwqiZlVmGKwuIi6Xa+HLiQMt
         aRl23BX5V7T1kBJUFS1rm90Hnck/Y4qSFX23W+yd+RpXZSf3Z+T8BoAdHVQIrDtYS2xt
         RkSX/26WAEXxSk5VA7W7c0ouYnkks926dZ5sEPKSZI91PIk2IUWvhxdrEJJE952u923d
         1niZQau7qJlj5J5W/xyqsJqzOapdjG7/enW08X2/zGgdwBwRFc20tYDE7NjbEyxxH5lr
         16qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322500; x=1792927300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6HVJA1CilQEoae2ePMD3zaqAFtAvSpqKqWYCEyEwCOg=;
        b=vijf9k53ZvKEQdU2qTbx+tF0Vgil/IIZsViEFT4iisdTCurLL0aFSv9WEKx6Gb7KnK
         YMS/CG3L4phxC9NLyTnVbgCwDTwUHpFWzyJlTdC1s0bwEj43hzB+Mj0LmG70lSueDlmL
         1g2Kyo0TaAW1F/Nv9oMe5SrwMuacmcZ203764NSMOvhhlx3U/nlQx5D8l/GoAUVmmQkb
         cqds9iIPf8GgSw9YVCOH3ooH50+rt1npIAFloqjAkyOFe9iPx+J/1GI6S72VVLc0ws0l
         mu7VH3W67jSaGGfXHQ9GLZCeu/DQ1tbrIFcLiLr4EJljix0jcCU4jb3QU/YjUu5aoyjj
         naJg==
X-Forwarded-Encrypted: i=1; AKwUvBxflpv7aZ4qEWc2NH1xmD0uBwyvH9/9E+RT6JZZTCOwxWxAMoHGNrGkHZx0Uo+3XuAhdzBnrk7QFf1SoQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6s2jzUCVw5KCaKAMbjpEIJ076dyZox1Q2h/YvafmYjiBp/kbR
	Iw2csGlgraROfSLwE1yVWpZjmvDb/nMILNS6kI2tN9YYXLkp90Bw9WECqFeMX4Qr7Muwhy+CeVX
	3Z1qE8L2YZ4Qh+X2RqUsoYGNFTIx8b8cbpSj+Q/o=
X-Gm-Gg: AYBFou0LR/NV0q1TTT2crTPs65R4nw6gAv6lG6rwAEPYe8D0TZHrDFaIWQ/1uht+Slw
	EHk7iZVFlTTbup+93/9C2w2i2sf66jAYdk/0m9/h6HMiK8nHtT1G1l8GkO/YATlQfv/83UP+YAR
	hIaNmTV3e++XYsw2GoI2Hoy7HuS6+b+0pSdEf0QS11gWD2lhLOS2njV0FyESDXIDRrEDpUaejoX
	K9q8oCXWgFqiIKgLXzD1RGGB0UtHBGoj/lntFZcTaOMzlHpW6qYgQXD9zp8iXYsH2Cdba7itNaj
	Kk/8Aajz3WTSiwheDHFtsp44l2XGrhi5AnNg+Yy/6yb2IsaCga1VL3Q=
X-Received: by 2002:a05:690c:588a:b0:8a4:d87f:8d52 with SMTP id
 00721157ae682-8b0f207372amr11089807b3.2.1792322500464; Sun, 18 Oct 2026
 04:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <20261016103630.6e8fbaa5@gandalf.local.home> <CALsPMBPnp8W68tFQKCtx=kxce4bUPx=MR_NwarOmKUJgC5_EPA@mail.gmail.com>
In-Reply-To: <CALsPMBPnp8W68tFQKCtx=kxce4bUPx=MR_NwarOmKUJgC5_EPA@mail.gmail.com>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sun, 18 Oct 2026 13:21:29 +0200
X-Gm-Features: AclHuK8cy2LSJv8imKz6jMFJVEsTHQHEoKxscGeMPDHByLswQn8-QeWvtdSi3IM
Message-ID: <CALsPMBOZjv9hdjf+ydbro5DHwuA4Uqt21ViWgLRFW9bnz5rDog@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_042142_230764_2FEFF589 
X-CRM114-Status: GOOD (  17.95  )
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

T24gU2F0LCBPY3QgMTcsIDIwMjYgYXQgMzo1NeKAr1BNIFJvbWFuIFN0b3JvemhlbmtvCjxyb21l
dXNtZWlzdGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAxNiwgMjAyNiBhdCA0
OjM24oCvUE0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIFN1biwgMzAgQXVnIDIwMjYgMTY6MzY6MzcgKzAyMDAKPiA+IFJvbWFuICdIZWRpbicg
U3Rvcm96aGVua28gPHJvbWV1c21laXN0ZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9yaXNjdl90bGIuaCBiL2luY2x1ZGUvdHJh
Y2UvZXZlbnRzL3Jpc2N2X3RsYi5oCj4gPgo+ID4gUGxlYXNlIGRvIG5vdCBwdXQgYXJjaGl0ZWN0
dXJlIHNwZWNpZmljIGV2ZW50cyBpbiBpbmNsdWRlL3RyYWNlLgo+ID4KPiA+IFRoZXkgYmVsb25n
IGluIHRoZSBhcmNoaXRlY3R1cmUuCj4gPgo+ID4gU2VlIHRoZSBleGFtcGxlIGNvZGUgaW4gc2Ft
cGxlcy90cmFjZV9ldmVudHMvdHJhY2UtZXZlbnRzLXNhbXBsZS5bY2hdCj4gPiBhcyB3ZWxsIGFz
IHRoZSBNYWtlZmlsZSB0aGVyZSBvbiBob3cgdG8gcHV0IHRyYWNlIGV2ZW50cyBpbiBkaXJlY3Rv
cmllcwo+ID4gb3V0c2lkZSBvZiBpbmNsdWRlL3RyYWNlLwo+ID4KPiA+IFRoYW5rcywKPiA+Cj4g
PiAtLSBTdGV2ZQo+ID4KPgo+IEhpIFN0ZXZlLAo+Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+
Cj4gSSd2ZSBtb3ZlZCB0aGUgdHJhY2UgZXZlbnQgZGVmaW5pdGlvbiB0bwo+IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcmlzY3ZfdGxiLmggaW4gdjUsIGZvbGxvd2luZyB0aGUgZXhpc3RpbmcKPiBS
SVNDLVYgdHJhY2Vwb2ludCBjb252ZW50aW9uLgo+Cj4gVGhlIHVwZGF0ZWQgcGF0Y2ggaXMgYXZh
aWxhYmxlIGhlcmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjEw
MTctdGxiX3RyYWNlcG9pbnQtdjUtMS0yNTZmYjUzOTNhN2ZAZ21haWwuY29tLwo+Cj4gVGhhbmtz
IGZvciBwb2ludGluZyB0aGlzIG91dC4KCkhpIFN0ZXZlLApJJ3ZlIHBvc3RlZCB2NiB3aXRoIGFu
IGFkZGl0aW9uYWwgZml4IGZvcgp0aGUgYWxpZ25tZW50IG9mIHRoZSBkeW5hbWljYWxseSBzdG9y
ZWQgQ1BVIG1hc2suCgpUaGUgdHJhY2UgZXZlbnQgZGVmaW5pdGlvbiByZW1haW5zIHVuZGVyCmFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcmlzY3ZfdGxiLmgsIGFzIGluIHY1LgoKVGhlIHVwZGF0ZWQg
cGF0Y2ggaXMgYXZhaWxhYmxlIGhlcmU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjYxMDE4LXRsYl90cmFjZXBvaW50LXY2LTEtMTQ0NzY0Mjc4NzBmQGdtYWlsLmNvbS9U
LyN1Cgo+Cj4gLS0KPiBLaW5kIHJlZ2FyZHMsCj4gUm9tYW4gJ0hlZGluJyBTdG9yb3poZW5rbwoK
LS0gCktpbmQgcmVnYXJkcywKUm9tYW4gJ0hlZGluJyBTdG9yb3poZW5rbwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
