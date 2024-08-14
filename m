Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBCDC52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 01:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4T57QDCcqq9Drb/FA1c5cvNv5r+2IiFNtjNBXek2+Ho=; b=jxcEI9S7268Eum
	f/qyMyowdVz6d8xaBoLw44FklUty6JNLIVV7cRjIoNpJLXtphIFsPLCbWuMs0FIG4kAqJcrnlIrnY
	B433jYSUO9CQpivz0OYZrFbyDVjAJAT1/yiwtH9oOb5nA3vZi7U4aWPv51mZHh9pleARxy6Wb+gXE
	1osdB9S1rOcMVgn65UEJ7NdnhfjKwlgg4qGUmDO0cimYBW6Bi/+X4vn7iMJEK/WSdNsgBYwgAkWoh
	LRETPnlJkDMZoR04pz/I6Yi3YF63o5cNZWOezql9pe54bco0ryoRBowhUVWDSAfzBcESIZln6/vHT
	ViXe4XWDZhP00xiQ9pHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se3Fd-00000005Q1Z-0BNK;
	Wed, 14 Aug 2024 01:56:37 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se3Fa-00000005Q0x-1hTE
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 01:56:36 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-260fed6c380so4272404fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 18:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723600593; x=1724205393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G2fruqv1n9Ss0goXxvFPeqf2LkkBVMKwQASCzStoE8=;
        b=kS8kNzcAFTU0beILhV24SFgW5Gu3wUGil0Xx58oqHIg1T9uxTIgML+43LNDdt+hXHx
         v5Z7oJLC+rfzsS+Cj2iimFvk3aw7SfDR6noDI/Nk/fGkII9qBO6ZxsR37ls44Xe0bgIM
         1XqiKcPO0fhIDs4VsV4CuiKOjf3dY7/p32oD8aDDApKE6gctZxP3gMiak6imYSQEzh0h
         u3EWtajpnO/zgMmsMLowGCE0GcRoXaBxfuyWVe+dcYdGQw20sQSYF955ZBQ+nIYYDHfw
         PpMSjaOz/ZQzbWdlMHrhQP7I39hhMq/EYYEczyTDqtnxa/a/RlMgtwro93oLvqngR6rv
         OUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723600593; x=1724205393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8G2fruqv1n9Ss0goXxvFPeqf2LkkBVMKwQASCzStoE8=;
        b=BOSb/QOJaEPd+TMbCZu8gxaCzqVrqTYjOkpOfAuvuD7FZ2GKFDVtZB3h1hGDEI0JXl
         Q3IG4zq7dlXiew6DdufLlvvlDF296z2DugvPsE0SIkw8Mj80B+K3NGV5vIFrwv22BYsZ
         W+b2etjYHjGTGtHjpM4bG3ebOOFjnpyPDxz+Qj5WssauCxoIOjY7XMH+M4tqBnAwhu97
         LbwBjkRNB4+sx0dVj4Hx7AsSeweAC/4lMrjzlMw97Ls1vvj6AOMDNSIDYQhNShV1CGf+
         GCEdoU7qpdDamqOYN9PCXPUKak+JdgQZOrdEnDaJankOE7zgEc7JfOSCHWrJ2hI4kSbx
         dScQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5tGSdIHCwzWOVMtWoeE4UxjJUAu+p7u9ca7cUAAQ8v1BgoY0w+egw10z8V8xgmnDd9PKgQuPK0oeQZ1g4fIoosQyoH57SZch4dThR+r9K
X-Gm-Message-State: AOJu0YzHhbUWsWkKuV+KpQU2c2nhRAFkbBgpsg9lfkIkfSMvtkvGKHcr
	q/r+y8LVv4cAK8gjHpV14MmAP8crbWREcrpXFYTN56yUBKQE3gEsTuTFNzVJQTSgFehQjq6/6/f
	mK0AwR9LVWl7ygJMJet8TpbsttQhDVQCvbC5+Gg==
X-Google-Smtp-Source: AGHT+IHWd0hlYEzs1C0Rh4miYN64b3wfj+uxdiVNOaHT0Q4lb9gQ1EiBX8uTVfyO3Lpanaly7QaJ+Ovil84n/B1I3x4=
X-Received: by 2002:a05:6871:e014:b0:268:79bd:9edb with SMTP id
 586e51a60fabf-26fe5c707b0mr1653171fac.47.1723600592963; Tue, 13 Aug 2024
 18:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240813081324.3205944-1-nick.hu@sifive.com> <CAAhSdy0W5mSVp79dF63BJkDCE_tMxrxWOxqwaTHghztX6dEm2w@mail.gmail.com>
In-Reply-To: <CAAhSdy0W5mSVp79dF63BJkDCE_tMxrxWOxqwaTHghztX6dEm2w@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 14 Aug 2024 09:56:22 +0800
Message-ID: <CAKddAkAOUJSnM=Px-YO=U6pis_7mODHZbmYqcgEzXikriqYvXQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Allow cpuidle pd used by other devices
To: Anup Patel <anup@brainfault.org>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_185634_475111_7C9BAB48 
X-CRM114-Status: GOOD (  28.85  )
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

SGkgQW51cAoKVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIQoKT24gVHVlLCBBdWcgMTMsIDIwMjQg
YXQgODoyNeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4g
T24gVHVlLCBBdWcgMTMsIDIwMjQgYXQgMTo0M+KAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gVG8gcHJldmVudCB0aGUgcHJvYmUgb2YgY29uc3VtZXIgZGV2
aWNlcyBiZWluZyBkZWZlcnJlZCwgY3JlYXRlIHRoZQo+ID4gcGxhdGZvcm0gZGV2aWNlcyBmb3Ig
ZWFjaCBwZCBub2RlIHVuZGVyICcvY3B1cy9wb3dlci1kb21haW5zJyBhbmQgbW92ZSB0aGUKPiA+
IGRyaXZlciBpbml0YWlsaXphdGlvbiB0byB0aGUgYXJjaF9pbml0Y2FsbC4KPgo+IFRvIHByZXZl
bnQgdGhlIHByb2JlIGRlZmVycmFsIG9mIGNvbnN1bWVyIGRldmljZXMsIHlvdSBjYW4gc2ltcGx5
IHVzZQo+IGZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQoKSBpbnN0ZWFkIG9mIGNyZWF0aW5nIGEgZHVt
bXkgcGxhdGZvcm0gZGV2aWNlLgo+CllvdSBhcmUgcmlnaHQuIEknbGwgcmVtb3ZlIHRoZSBkdW1t
eSBwbGF0Zm9ybSBkZXZpY2UuCklmIHRoZSBmd25vZGVfZGV2X2luaXRpYWxpemVkKCkgd2FzIGRv
bmUgYmVmb3JlCmZ3X2RldmxpbmtfY3JlYXRlX2RldmxpbmsoKSwgdGhlIGxpbmsgd2lsbCBiZSBk
cm9wcGVkLgpUaGUgZndub2RlX2Rldl9pbml0aWFsaXplZCgpIGlzIGFscmVhZHkgaW5jbHVkZWQg
aW4gdGhlCm9mX2dlbnBkX2FkZF9wcm92aWRlcl9zaW1wbGUoKSBhbmQgSWYgdGhlIGZ3bm9kZV9k
ZXZfaW5pdGlhbGl6ZWQoKQp3YXMgZG9uZSBiZWZvcmUgZndfZGV2bGlua19jcmVhdGVfZGV2bGlu
aygpLCB0aGUgbGluayB3aWxsIGJlIGRyb3BwZWQuCnNvIEkgdGhpbmsgd2Ugb25seSBuZWVkIHRv
IG1vdmUgdGhlIGRyaXZlciBpbml0aWFsaXphdGlvbgp0byB0aGUgYXJjaF9pbml0Y2FsbC4KVGhh
bmtzIQoKPiA+IFRoZSBjb25zdW1lciBkZXZpY2VzIHRoYXQgaW5zaWRlIHRoZSBjcHUvY2x1c3Rl
ciBwb3dlciBkb21haW4gbWF5IHJlZ2lzdGVyCj4gPiB0aGUgZ2VucGQgbm90aWZpZXIgd2hlcmUg
dGhlaXIgcG93ZXIgZG9tYWlucyBhcmUgcG9pbnQgdG8gdGhlIHBkIG5vZGVzCj4gPiB1bmRlciAn
L2NwdXMvcG93ZXItZG9tYWlucycuIElmIHRoZSBjcHVpZGxlLm9mZj09MSwgdGhlIGdlbnBkIG5v
dGlmaWVyCj4gPiB3aWxsIGZhaWwgZHVlIHRvIHNiaV9jcHVpZGxlX3BkX2FsbG93X2RvbWFpbl9z
dGF0ZSBpcyBub3Qgc2V0LiBXZSBhbHNvCj4gPiBuZWVkIHRoZSBzYmlfY3B1aWRsZV9jcHVocF91
cC9kb3duIHRvIGludm9rZSB0aGUgY2FsbGJhY2tzLiBUaGVyZWZvcmUsCj4gPiBhZGQgYSBjcHVp
ZGxlX2Rpc2FibGVkKCkgY2hlY2sgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBjcHVpZGxlIGRyaXZl
ciB0bwo+ID4gYWRkcmVzcyB0aGUgaXNzdWUuCj4KPiBJIHRoaW5rIGRlYWxpbmcgd2l0aCBjcHVp
ZGxlLm9mZj09MSBjYXNlIHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgo+ClN1cmUsIEknbGwg
dXBkYXRlIGl0IGluIHRoZSBuZXh0IHBhdGNoCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sg
SHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyNDAyMjYwNjUxMTMuMTY5MDUzNC0xLW5pY2suaHVAc2lmaXZlLmNvbS8KPiA+IFN1
Z2dlc3RlZC1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYyB8IDI0ICsrKysrKysrKysr
KysrKysrKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1y
aXNjdi1zYmkuYyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiBpbmRl
eCBhNmUxMjNkZmUzOTQuLmQ2YjAxZmM2NGY5NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvY3B1
aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiArKysgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRs
ZS1yaXNjdi1zYmkuYwo+ID4gQEAgLTE2LDYgKzE2LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gICNpbmNsdWRlIDxs
aW51eC9vZi5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+ID4gICNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
Pgo+ID4gICNpbmNsdWRlIDxsaW51eC9wbV9kb21haW4uaD4KPiA+IEBAIC0yNSw2ICsyNiw3IEBA
Cj4gPiAgI2luY2x1ZGUgPGFzbS9zbXAuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3N1c3BlbmQuaD4K
PiA+Cj4gPiArI2luY2x1ZGUgImNwdWlkbGUuaCIKPiA+ICAjaW5jbHVkZSAiZHRfaWRsZV9zdGF0
ZXMuaCIKPiA+ICAjaW5jbHVkZSAiZHRfaWRsZV9nZW5wZC5oIgo+ID4KPiA+IEBAIC0zMzYsNiAr
MzM4LDkgQEAgc3RhdGljIGludCBzYmlfY3B1aWRsZV9pbml0X2NwdShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIGludCBjcHUpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICAgICAgICAg
fQo+ID4KPiA+ICsgICAgICAgaWYgKGNwdWlkbGVfZGlzYWJsZWQoKSkKPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICAgICAgICAgcmV0ID0gY3B1aWRsZV9yZWdpc3Rlcihk
cnYsIE5VTEwpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIGdvdG8g
ZGVpbml0Owo+ID4gQEAgLTM4MCwyMCArMzg1LDI2IEBAIHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVf
cGRfcG93ZXJfb2ZmKHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiAqcGQpCj4gPiAgc3RydWN0IHNi
aV9wZF9wcm92aWRlciB7Cj4gPiAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgbGluazsKPiA+ICAg
ICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+ID4gKyAgICAgICBzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2Owo+ID4gIH07Cj4gPgo+ID4gIHN0YXRpYyBMSVNUX0hFQUQoc2JpX3Bk
X3Byb3ZpZGVycyk7Cj4gPgo+ID4gIHN0YXRpYyBpbnQgc2JpX3BkX2luaXQoc3RydWN0IGRldmlj
ZV9ub2RlICpucCkKPiA+ICB7Cj4gPiArICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXY7Cj4gPiAgICAgICAgIHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiAqcGQ7Cj4gPiAgICAgICAg
IHN0cnVjdCBzYmlfcGRfcHJvdmlkZXIgKnBkX3Byb3ZpZGVyOwo+ID4gICAgICAgICBzdHJ1Y3Qg
ZGV2X3Bvd2VyX2dvdmVybm9yICpwZF9nb3Y7Cj4gPiAgICAgICAgIGludCByZXQgPSAtRU5PTUVN
Owo+ID4KPiA+ICsgICAgICAgcGRldiA9IG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobnAsIG5w
LT5uYW1lLCBOVUxMKTsKPiA+ICsgICAgICAgaWYgKCFwZGV2KQo+ID4gKyAgICAgICAgICAgICAg
IGdvdG8gb3V0Owo+ID4gKwo+ID4gICAgICAgICBwZCA9IGR0X2lkbGVfcGRfYWxsb2MobnAsIHNi
aV9kdF9wYXJzZV9zdGF0ZV9ub2RlKTsKPiA+ICAgICAgICAgaWYgKCFwZCkKPiA+IC0gICAgICAg
ICAgICAgICBnb3RvIG91dDsKPiA+ICsgICAgICAgICAgICAgICBnb3RvIGZyZWVfcGRldjsKPiA+
Cj4gPiAgICAgICAgIHBkX3Byb3ZpZGVyID0ga3phbGxvYyhzaXplb2YoKnBkX3Byb3ZpZGVyKSwg
R0ZQX0tFUk5FTCk7Cj4gPiAgICAgICAgIGlmICghcGRfcHJvdmlkZXIpCj4gPiBAQCAtNDE5LDYg
KzQzMCw3IEBAIHN0YXRpYyBpbnQgc2JpX3BkX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCkK
PiA+ICAgICAgICAgICAgICAgICBnb3RvIHJlbW92ZV9wZDsKPiA+Cj4gPiAgICAgICAgIHBkX3By
b3ZpZGVyLT5ub2RlID0gb2Zfbm9kZV9nZXQobnApOwo+ID4gKyAgICAgICBwZF9wcm92aWRlci0+
cGRldiA9IHBkZXY7Cj4gPiAgICAgICAgIGxpc3RfYWRkKCZwZF9wcm92aWRlci0+bGluaywgJnNi
aV9wZF9wcm92aWRlcnMpOwo+ID4KPiA+ICAgICAgICAgcHJfZGVidWcoImluaXQgUE0gZG9tYWlu
ICVzXG4iLCBwZC0+bmFtZSk7Cj4gPiBAQCAtNDMwLDYgKzQ0Miw4IEBAIHN0YXRpYyBpbnQgc2Jp
X3BkX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiA+ICAgICAgICAga2ZyZWUocGRfcHJv
dmlkZXIpOwo+ID4gIGZyZWVfcGQ6Cj4gPiAgICAgICAgIGR0X2lkbGVfcGRfZnJlZShwZCk7Cj4g
PiArZnJlZV9wZGV2Ogo+ID4gKyAgICAgICBvZl9wbGF0Zm9ybV9kZXZpY2VfZGVzdHJveSgmcGRl
di0+ZGV2LCBOVUxMKTsKPiA+ICBvdXQ6Cj4gPiAgICAgICAgIHByX2VycigiZmFpbGVkIHRvIGlu
aXQgUE0gZG9tYWluIHJldD0lZCAlcE9GXG4iLCByZXQsIG5wKTsKPiA+ICAgICAgICAgcmV0dXJu
IHJldDsKPiA+IEBAIC00NDcsNiArNDYxLDcgQEAgc3RhdGljIHZvaWQgc2JpX3BkX3JlbW92ZSh2
b2lkKQo+ID4gICAgICAgICAgICAgICAgIGlmICghSVNfRVJSKGdlbnBkKSkKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGtmcmVlKGdlbnBkKTsKPiA+Cj4gPiArICAgICAgICAgICAgICAgb2Zf
cGxhdGZvcm1fZGV2aWNlX2Rlc3Ryb3koJnBkX3Byb3ZpZGVyLT5wZGV2LT5kZXYsIE5VTEwpOwo+
ID4gICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHBkX3Byb3ZpZGVyLT5ub2RlKTsKPiA+ICAg
ICAgICAgICAgICAgICBsaXN0X2RlbCgmcGRfcHJvdmlkZXItPmxpbmspOwo+ID4gICAgICAgICAg
ICAgICAgIGtmcmVlKHBkX3Byb3ZpZGVyKTsKPiA+IEBAIC01NDgsNyArNTYzLDEwIEBAIHN0YXRp
YyBpbnQgc2JpX2NwdWlkbGVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+
ICAgICAgICAgLyogU2V0dXAgQ1BVIGhvdHBsdXQgbm90aWZpZXJzICovCj4gPiAgICAgICAgIHNi
aV9pZGxlX2luaXRfY3B1aHAoKTsKPiA+Cj4gPiAtICAgICAgIHByX2luZm8oImlkbGUgZHJpdmVy
IHJlZ2lzdGVyZWQgZm9yIGFsbCBDUFVzXG4iKTsKPiA+ICsgICAgICAgaWYgKGNwdWlkbGVfZGlz
YWJsZWQoKSkKPiA+ICsgICAgICAgICAgICAgICBwcl9pbmZvKCJjcHVpZGxlIGlzIGRpc2FibGVk
XG4iKTsKPiA+ICsgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgIHByX2luZm8oImlkbGUg
ZHJpdmVyIHJlZ2lzdGVyZWQgZm9yIGFsbCBDUFVzXG4iKTsKPiA+Cj4gPiAgICAgICAgIHJldHVy
biAwOwo+ID4KPiA+IEBAIC01OTIsNCArNjEwLDQgQEAgc3RhdGljIGludCBfX2luaXQgc2JpX2Nw
dWlkbGVfaW5pdCh2b2lkKQo+ID4KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gLWRl
dmljZV9pbml0Y2FsbChzYmlfY3B1aWRsZV9pbml0KTsKPiA+ICthcmNoX2luaXRjYWxsKHNiaV9j
cHVpZGxlX2luaXQpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgo+IFJlZ2FyZHMsCj4gQW51cAoK
UmVnYXJkcywKTmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
