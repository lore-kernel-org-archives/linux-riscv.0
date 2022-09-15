Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBB1ECAAD8
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 02:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0t2Y+18Lqh+CVPTKEAemB/CXbiiw3dOqnh09Ir2xSg=; b=EoohzHe5tujjoR
	MpMqx3oVumAwrKrkxrgo0IogX4sF8AKVi6SCcuTi/Dcdcy2HbYAag0PNwM5VzLh/YstAxhEfe0JPs
	Dv/551k82Hep0PnbqYQCXgHqigU4uVl7rNlsm8uOGnlQ/Zjn0QW/st8FIVcjVcaOQgrdCpc7qqujk
	fnORX9frHaZNN8yhtC8N+YM696/Z8T7rghjqQVfcKx54A+0elg34knrk+9fgADzITwrXJLXMNFnh5
	h6OR32tz/wVOeWn/gAhWlIzMl1Akwwn617w/slyhdJX4SXP5n/O4hFe9YsDs2Vz43I49vtATWrK62
	HJWhw1xSvYJpRugsDxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYehg-00FkxN-He; Thu, 15 Sep 2022 02:34:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYehd-00Fkup-Nc
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 02:34:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id l8so7558984wmi.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 19:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=rr94za50cBF0zec0LRlYL4D144/9y5aApe53xqinMzk=;
        b=E+DtOFr2s8hZj743bjOzzcCMoijxHA4OxQzRGJBEb6f7BkGLlok/HGrnJPh1H/S+FP
         ICahiNwVjLY/9y3VPQg/8CEfLuW7vTimQ+K/tbhQzQjba+WIVKG5mOoh4dToJZqyie1X
         XfiOnmCoQVkTd6Iu+jcoeqfktvixji4d8VBBJkV2QnBXHzxCOo6X5bQ+FhQCkkEj5XyC
         3nXvI0EfdPsO+i8LSMsOgeeqnpwK339zDY6HT+b6w7kHZulaSLiPQvBIVlFpgxQOsohm
         hRlSC9dmbznWK1PMeroRS4mNTW/zSzKOY5ETEtmIZlAQb/taXi4r8/3UJut+96siQax0
         h1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rr94za50cBF0zec0LRlYL4D144/9y5aApe53xqinMzk=;
        b=zoNPH3OtaZgY8D8gZKBCLzbBGjH8Q62dmQcEzVoZKG3QKhPsy1BQjzD8jbkfI2B2e5
         7hE9ObY9kBOBA+JAqFh1ST/MmaJl7JgZTMWoHy4VtFFr8/RBZJo6b83XXnvhyxh2J6oy
         6pyl6F5MOJz3uFM9U4Nma1sIAUin4dz7qFLBjrpdxQLzvnvKR2a817M60djU1bimpLNs
         ZEJmGvQdTeb/uYDiNbevR8ms/wMWyBQAdYxOAsGG3IUUWNyrpkX5bhRjTFtew/2Gb78p
         pIQSfaXxnhQfAo5csKjoOJ6qLKsjZEoOJ073CdtI6e3VFbNXtgOuN7H28NEfPBUoaxBf
         zpWg==
X-Gm-Message-State: ACgBeo15YYMCj2NizHXrLLjlaf7Qv1g3M+wnQy4KEhsHbvubUkfCz4LT
	9csPt6Yl3ysIoqwZWHtWDHe2WA==
X-Google-Smtp-Source: AA6agR4uP4iDVI9ZHMzFZi6RNCp3fxaowv1+49uxAEdMNSshQp9o6rI5c0ypmX8RDEfrPWHZlnm8Cw==
X-Received: by 2002:a05:600c:2e15:b0:3b4:9c95:2871 with SMTP id o21-20020a05600c2e1500b003b49c952871mr5026495wmf.133.1663209247116;
        Wed, 14 Sep 2022 19:34:07 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d5681000000b00228dd80d78asm850494wrv.86.2022.09.14.19.34.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Sep 2022 19:34:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch
 function
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAJF2gTRc487qEme5tQw4ich5xuf8_DYhTB8fp=TXav3Gs4KWnQ@mail.gmail.com>
Date: Thu, 15 Sep 2022 03:34:05 +0100
Cc: Andy Chiu <andy.chiu@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 rostedt@goodmis.org,
 Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 jpoimboe@kernel.org,
 jbaron@akamai.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Zong Li <zong.li@sifive.com>,
 kernel@esmil.dk,
 linux-riscv@lists.infradead.org
Message-Id: <420C6077-EF0D-4F99-8C46-85396E356335@jrtc27.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-6-andy.chiu@sifive.com>
 <82E75CB4-3849-455E-807F-A0DBCAEED3CE@jrtc27.com>
 <CAJF2gTRc487qEme5tQw4ich5xuf8_DYhTB8fp=TXav3Gs4KWnQ@mail.gmail.com>
To: Guo Ren <guoren@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_193409_798631_DB2C4500 
X-CRM114-Status: GOOD (  14.68  )
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

T24gMTUgU2VwdCAyMDIyLCBhdCAwMjo0NywgR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdy
b3RlOgo+IAo+IE9uIFdlZCwgU2VwIDE0LCAyMDIyIGF0IDEwOjI0IFBNIEplc3NpY2EgQ2xhcmtl
IDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiAxMyBTZXB0IDIwMjIsIGF0IDEw
OjQyLCBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cm90ZToKPj4+IAo+Pj4gcnVu
dGltZSBjb2RlIHBhdGNoaW5nIG11c3QgYmUgZG9uZSBhdCBhIG5hdHVyYWxseSBhbGlnbmVkIGFk
ZHJlc3MsIG9yIHdlCj4+PiBtYXkgZXhlY3V0ZSBvbiBhIHBhcnRpYWwgaW5zdHJ1Y3Rpb24uCj4+
PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4+
PiBSZXZpZXdlZC1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPj4+
IC0tLQo+Pj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9qdW1wX2xhYmVsLmggfCAyICsrCj4+PiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
anVtcF9sYWJlbC5oCj4+PiBpbmRleCAzOGFmMmVjN2I5YmYuLjcyOTk5MWU4Zjc4MiAxMDA2NDQK
Pj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oCj4+PiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaAo+Pj4gQEAgLTE4LDYgKzE4LDcgQEAg
c3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGFyY2hfc3RhdGljX2JyYW5jaChzdHJ1Y3Qgc3Rh
dGljX2tleSAqa2V5LAo+Pj4gYm9vbCBicmFuY2gpCj4+PiB7Cj4+PiBhc21fdm9sYXRpbGVfZ290
bygKPj4+ICsgIiAuYWxpZ24gMiBcblx0Igo+PiAKPj4gLmFsaWduIGlzIGEgaG9ycmlibGUgZGly
ZWN0aXZlIHdob3NlIG1lYW5pbmcgY2hhbmdlcyBiZXR3ZWVuCj4+IGFyY2hpdGVjdHVyZXMgYW5k
IHJlcXVpcmVzIGNhcmVmdWwgdGhvdWdodCwgZXNwZWNpYWxseSB3aGVuIHRoZQo+PiBhcmd1bWVu
dCBpcyBhIHBvd2VyIG9mIDIuIEJldHRlciB0byB1c2UgLmJhbGlnbiA0LCBvciAucDJhbGlnbiAy
IGlmIHlvdQo+PiByZWFsbHkgd2FudCB0byBmb3Igc29tZSByZWFzb24uCj4gRG8gd2UgcmVhbGx5
IG5lZWQgdG8gYWxpZ24gaGVyZT8gU2hvdWxkIGl0IGJlIG5hdHVyYWxseSBkb25lIGJ5IHRoZSBj
b21waWxlcj8KCkNvbXBpbGVycyBkb27igJl0IGFkZCBhbGlnbm1lbnQgZG8gaW5saW5lIGFzc2Vt
Ymx5IGJleW9uZCB3aGF04oCZcyBuZWVkZWQuCkFuZCBhc3NlbWJsZXJzIHdvbuKAmXQgYWxpZ24g
YmV5b25kIHdoYXQgdGhlIGFyY2hpdGVjdHVyZSByZXF1aXJlcyBoZXJlCmVpdGhlciBhcyBmYXIg
YXMgSSBrbm93IGZvciAub3B0aW9uIHJ2Yywgc2luY2Ugbm9ybWFsbHkgeW91IHN0aWxsIGhhdmUK
YW4gUlZDLWNhcGFibGUgcHJvY2Vzc29yIHlvdSBqdXN0IGRvbuKAmXQgd2FudCBjb21wcmVzc2Vk
IGluc3RydWN0aW9ucyBhdAp0aGF0IHNwZWNpZmljIHBvaW50LgoKSmVzcwoKPj4gCj4+IEplc3MK
Pj4gCj4+PiAiIC5vcHRpb24gcHVzaCBcblx0Igo+Pj4gIiAub3B0aW9uIG5vcmVsYXggXG5cdCIK
Pj4+ICIgLm9wdGlvbiBub3J2YyBcblx0Igo+Pj4gQEAgLTM5LDYgKzQwLDcgQEAgc3RhdGljIF9f
YWx3YXlzX2lubGluZSBib29sIGFyY2hfc3RhdGljX2JyYW5jaF9qdW1wKHN0cnVjdCBzdGF0aWNf
a2V5ICprZXksCj4+PiBib29sIGJyYW5jaCkKPj4+IHsKPj4+IGFzbV92b2xhdGlsZV9nb3RvKAo+
Pj4gKyAiIC5hbGlnbiAyIFxuXHQiCj4+PiAiIC5vcHRpb24gcHVzaCBcblx0Igo+Pj4gIiAub3B0
aW9uIG5vcmVsYXggXG5cdCIKPj4+ICIgLm9wdGlvbiBub3J2YyBcblx0Igo+Pj4gLS0KPj4+IDIu
MzYuMAo+Pj4gCj4+PiAKPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKPj4gCj4gCj4gCj4gLS0gCj4gQmVzdCBSZWdhcmRzCj4gR3Vv
IFJlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
