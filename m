Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5C1C54E65
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sanHGLSxrf82bfMQI7zgh6b3Nnce7Ikbom8Ad4PoXCs=; b=RS0UbPsv65qbvP
	vfgBrP+t2RynP6zPppajT4xyQH2MBj6O2Vu0SDs5j3AQqGBloBdzzO0wuxfW5QXTdj3cJX7s5glsb
	2a3I6IkbzXyRy0yVpLqKX5BYpF5IuG8jqiCCgyGtm3v316MX8ZesfXlQwv0DLP5onlOeQ1NRqSSXp
	cbxyKvhTXzUtz8IaA7cu8CQqNb+nutKBeNu+DDq8MDfmmPGm8Fi5ru+9eF82ugD0c0k4DZILEXoXV
	mhumXrKvh+bLoVbEU6ZkbVmvW6Y9YGx+sfCHJSPJqPBsFUND5SxuVXri13YB+JpiwYA1mCH8tuHGS
	mGr5VK2jx7+C4r4VWMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgyz-0000000FXim-454D;
	Wed, 21 May 2025 10:47:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgyx-0000000FXi9-1ZEq
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 10:47:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a365a68057so3639870f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747824449; x=1748429249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuPh8lUlczaY3BGjlWUSLoXDI89Tgqqt75TgaRLFcUw=;
        b=uAouAl5jMKSHNkvWSRezJ2k3gP1ZLYTKl0TACh61S+zc/CMUk2qPC3EERAxie71igN
         +Wl4E6DYiuTKC2EZzLE25WsoWd4/EURcEoqblLGyCQTCqA+CIG88mWqkCYSNL2QDx2Lu
         fS1v2iiHO0z/rBrMZ5NB3AyZc2lIeKuxriTXAhdcaKMY344IH0O+GQo8j6kX929MNpTe
         4jscXJSEh8iJAdbYBl3myirE838DP4fviT9rzVOPS9ab6Jqs73lJhV+FKeTQVjdo3Azn
         Dgpzq+zn6V1CEeiAOupu2l9R/vH/G/PqWazjnpFQKzgglIHX4fOfYFWbeDEPe8+hkdtS
         XQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824449; x=1748429249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuPh8lUlczaY3BGjlWUSLoXDI89Tgqqt75TgaRLFcUw=;
        b=gpDNWBEqeW95bcqcqAW4o0PeawnFIOVND2riEKWxT9X7z2kZmioM7BVORw2TVKhWtn
         npRjKS9i5VQLXv2mSS85pvUXKQucjCBaUVHJAJoTWHKBMBxyMw14KaXwXzH/9dJhOHyg
         tspgj3aJgKQmTl8u1ystbB+y/Fhjw3xzk/afMoLZj411bQ2DbvmlcKfzZy0W7TmVVVSr
         zIivte5wmKOEEl8UJms/GdV58ycDWA4hK8/bIq8HPKJ/j/b4tv2oqWNAtEzJ+5d2mcMo
         1TtNnHHpM/tD0xILECUx3RLH748pA3D7WZ3zjBYAWQ+O+KEocZhHT900OipT9wQTrvl1
         a0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqa7eHNqOflVTWvUfHL8BEnNx8Vc3r4XTmLpCHaQtM7IQrbuZsRm3szWBUUK11wV/A/a2hmXCr2cR+8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yydt4BKn4ZhU4L0RCNbm6buapCutA+0mnCX8beOk60AngnJ7uSd
	3lelAq/0fuk1MPcI0olFK0jUQs6gko/uR0aJBjdHdY1MNS/ey0CX+zBKztIhC6XSQQVAyQAYrZ1
	ypjvBYBCC9CBmUTLYIMZwH/5+itsm7yrVcLT8SXNVrQ==
X-Gm-Gg: ASbGnctVSMdVmJE0mB0VXUcG312D1QpiKCT/LVKPwFOn7SL3/GNu0RXlzdgXEH0Rbh2
	x7wnFqaeo5knreEUdheAR9is7U/a2t3rf5KN+ylnjyNtSJK1fHEHjCftTqV5isuY41RGi+O9Wdh
	0B3IK0Rj/ReEQxR8bVAlPHGtv0pFo87NIr2ppiQoPJkSDkn+cvEnvrfqQHLo27BS4KRA==
X-Google-Smtp-Source: AGHT+IGWLqIKvXp7uTTelzRMHmTQzbuuwrui/N/uxywbrLDDyPwY7Oe/OpLTj407ZB5WzuCvFYwjCBz9VDD0W0w8LJM=
X-Received: by 2002:a05:6000:420c:b0:3a3:7709:3038 with SMTP id
 ffacd0b85a97d-3a3770931fdmr7245809f8f.38.1747824449047; Wed, 21 May 2025
 03:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250116230955.867152-1-rkanwal@rivosinc.com> <20250116230955.867152-2-rkanwal@rivosinc.com>
 <CAP-5=fU9ovvb-JopPqQfNaj6xtL=u_WZO-b56RdhBmUw4mY0ZA@mail.gmail.com> <CAECbVCvX8St8sXh9pTnyO_94-cJT_DB4MyggtS_-PXqWNtXDXw@mail.gmail.com>
In-Reply-To: <CAECbVCvX8St8sXh9pTnyO_94-cJT_DB4MyggtS_-PXqWNtXDXw@mail.gmail.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Wed, 21 May 2025 11:47:18 +0100
X-Gm-Features: AX0GCFuAJ7CTZOCLEIx1J9F8NwWg5BFa7WW9XLKJsd7oIYnChaTtfUeId9q8_es
Message-ID: <CAECbVCui6ZgHBXBr3LdVGd16ERe0GgAnA1zy_zOQZVTU3bPoWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] perf: Increase the maximum number of samples to 256.
To: Ian Rogers <irogers@google.com>, ak@linux.intel.com
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, 
	ajones@ventanamicro.com, anup@brainfault.org, acme@kernel.org, 
	atishp@rivosinc.com, beeman@rivosinc.com, brauner@kernel.org, 
	conor@kernel.org, heiko@sntech.de, mingo@redhat.com, james.clark@arm.com, 
	renyu.zj@linux.alibaba.com, jolsa@kernel.org, jisheng.teoh@starfivetech.com, 
	palmer@dabbelt.com, will@kernel.org, kaiwenxue1@gmail.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_034731_682897_12194652 
X-CRM114-Status: GOOD (  41.26  )
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

T24gVGh1LCBBcHIgMTcsIDIwMjUgYXQgMTo1MeKAr1BNIFJham5lc2ggS2Fud2FsIDxya2Fud2Fs
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiArIEFkZGluZyBBbmRpIEtsZWVuLgo+Cj4gT24gVGh1
LCBGZWIgMjAsIDIwMjUgYXQgNjo1MeKAr1BNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBKYW4gMTYsIDIwMjUgYXQgMzoxMOKAr1BNIFJham5l
c2ggS2Fud2FsIDxya2Fud2FsQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFJJU0NW
IENUUiBleHRlbnNpb24gc3VwcG9ydCBhIG1heGltdW0gZGVwdGggb2YgMjU2IGxhc3QgYnJhbmNo
IHJlY29yZHMuCj4gPiA+IFRoZSAxMjcgZW50cmllcyBsaW1pdCByZXN1bHRzIGluIGNvcnJ1cHRp
bmcgQ1RSIGVudHJpZXMgZm9yIFJJU0MtViBpZgo+ID4gPiBjb25maWd1cmVkIHRvIGJlIDI1NiBl
bnRyaWVzLiBUaGlzIHdpbGwgbm90IGltcGFjdCBhbnkgb3RoZXIgYXJjaGl0ZWN0dXJlcwo+ID4g
PiBhcyBpdCBpcyBqdXN0IGluY3JlYXNpbmcgbWF4aW11bSBsaW1pdCBvZiBwb3NzaWJsZSBlbnRy
aWVzLgo+ID4KPiA+IEkgd29uZGVyIGlmIHJhdGhlciB0aGFuIGEgY29uc3RhbnQgdGhpcyBjb2Rl
IHNob3VsZCBqdXN0IHVzZSB0aGUgYXV0bwo+ID4gcmVzaXppbmcgaGFzaG1hcCBjb2RlPwo+ID4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2hhc2htYXAuaAo+ID4KPiA+IEkgYXNzdW1l
IHRoZSB2YWx1ZSBvZiAxMjcgY29tZXMgZnJvbSBwZXJmX2V2ZW50LmgncyBQRVJGX01BWF9TVEFD
S19ERVBUSDoKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2luY2x1ZGUvdWFwaS9saW51eC9wZXJmX2V2ZW50
LmgjbjEyNTIKPiA+Cj4gPiBQZXJoYXBzIHRoZXNlIGNvbnN0YW50cyBzaG91bGRuJ3QgZXhpc3Qu
IFRoZSBwZXJmLXJlY29yZCBtYW4gcGFnZSBtZW50aW9uczoKPiA+IHN5c2N0bC5rZXJuZWwucGVy
Zl9ldmVudF9tYXhfc3RhY2sKPiA+IHdoaWNoIEkgYmVsaWV2ZSBnZXRzIGEgdmFsdWUgZnJvbQo+
ID4gL3Byb2Mvc3lzL2tlcm5lbC9wZXJmX2V2ZW50X21heF9zdGFjaywgc28gbWF5YmUgdGhlc2Ug
c2hvdWxkIGJlCj4gPiBydW50aW1lIGRldGVybWluZWQgY29uc3RhbnRzIHJhdGhlciB0aGFuIGNv
bXBpbGUgdGltZS4KCldoaWxlIHdvcmtpbmcgb24gdGhpcywgSSBjYW1lIGFjcm9zcyB0aGUgZm9s
bG93aW5nIHR3byBwYXRjaGVzLiBJdApsb29rcyBsaWtlIHdoYXQKeW91IGhhdmUgc3VnZ2VzdGVk
LCBpdCB3YXMgdHJpZWQgYmVmb3JlIGJ1dCBsYXRlciBvbiBBcm5hbGRvIHJldmVydGVkIHRoZSBj
aGFuZ2UKZnJvbSByZXBvcnQgYW5kIHNjcmlwdCBjbWRzIGR1ZSB0byByZWFzb25zIG1lbnRpb25l
ZCBpbiB0aGUgc2Vjb25kIHBhdGNoLgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNDYx
NzY3NDcyLTg4MjctMzEtZ2l0LXNlbmQtZW1haWwtYWNtZUBrZXJuZWwub3JnLwpodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzE0NjM2OTY0OTMtMjc1MjgtOC1naXQtc2VuZC1lbWFpbC1hY21l
QGtlcm5lbC5vcmcvCgpSZWdhcmRzClJham5lc2gKCgo+ID4KPgo+IFRoYW5rcyBJYW4gZm9yIHlv
dXIgZmVlZGJhY2suIEkgYW0gbm90IHN1cmUgaWYgaXQncyBmZWFzaWJsZSB0byB1c2UgYXV0bwo+
IHJlc2l6aW5nIGhhc2htYXAgaGVyZS4gT24gZWFjaCBzYW1wbGUgb2YgMjU2IGVudHJpZXMgd2Ug
d2lsbCBiZSBkb2luZwo+IDYgY2FsbG9jcyBhbmQgdHJhbnNmZXJyaW5nIGEgd2hvbGUgbG90IG9m
IGVudHJpZXMgaW4gaGFzaG1hcF9ncm93LiBXZQo+IGNhbid0IHJldXNlIG9sZCBoYXNobWFwIGFz
IHdlbGwuIE9uIGVhY2ggc2FtcGxlIHdlIGJlYXIgdGhlIHNhbWUgY29zdAo+Cj4gQnV0IEkgZG8g
YWdyZWUgdGhpcyBzaG91bGQgYmUgbW9yZSBkeW5hbWljIGJ1dCB0aGUgbWF4aW11bSBudW1iZXIK
PiBvZiBlbnRyaWVzIHJlbW92ZV9sb29wcyBjYW4gcHJvY2VzcyBpcyBsaW1pdGVkIGJ5IHRoZSB0
eXBlIG9mIGNoYXNoIGFycmF5Cj4gaGVyZS4gSSBjYW4gY2hhbmdlIGl0IGFuZCByZWxhdGVkIGxv
Z2ljIHRvIHVzZSB1aW50MTZfdCBvciBoaWdoZXIgYnV0IHdlCj4gd2lsbCBzdGlsbCBoYXZlIGEg
Y2FwIG9uIHRoZSBudW1iZXIgb2YgZW50cmllcy4KPgo+IFBFUkZfTUFYX0JSQU5DSF9ERVBUSCBz
ZWVtcyB0byBiZSBkZW5vdGluZyB3aGF0IHJlbW92ZV9sb29wcwo+IGNhbiBwcm9jZXNzLiBUaGlz
IGlzIGJlaW5nIHVzZWQgYnkgdGhyZWFkX19yZXNvbHZlX2NhbGxjaGFpbl9zYW1wbGUgdG8KPiBj
aGVjayBpZiB0aGUgc2FtcGxlIGlzIHByb2Nlc3NhYmxlIGJlZm9yZSBjYWxsaW5nIHJlbW92ZV9s
b29wcy4gSSB0aGluawo+IHRoaXMgY2FuJ3QgYmUgY2hhbmdlZCB0byB1c2UgcGVyZl9ldmVudF9t
YXhfc3RhY2suIEJ1dCBJIGNhbiByZW5hbWUKPiB0aGlzIG1hY3JvIHRvIGF2b2lkIGNvbmZ1c2lv
bi4KPgo+IEkgZGlkbid0IG5vdGljZSBQRVJGX01BWF9TVEFDS19ERVBUSC4gVGhpcyBzZWVtcyB0
byBiZSBkZWZpbmVkIGluCj4gbXVsdGlwbGUgcGxhY2VzIGFuZCB0b3VjaGVzIGJwZiBhcyB3ZWxs
LiBJIGFncmVlIHRoYXQgd2Ugc2hvdWxkIGF2b2lkCj4gdXNpbmcgdGhpcyBtYWNybyBhbmQgdXNl
IHJ1bnRpbWUgZGV0ZXJtaW5lZCB2YWx1ZSBpbnN0ZWFkLiBUYmggSSBkb24ndAo+IGhhdmUgc3Vw
ZXIgaW4tZGVwdGggcGVyZiB1bmRlcnN0YW5kaW5nLiBJIHdpbGwgZ2l2ZSB0aGlzIGEgdHJ5IGFu
ZCBzZW5kIGEKPiBwYXRjaCBpbiB0aGUgbmV4dCB1cGRhdGUuIEl0IHdvdWxkIGJlIGhlbHBmdWwg
aWYgeW91IGNhbiByZXZpZXcgaXQuCj4KPiBUaGFua3MKPiAtUmFqbmVzaAo+Cj4gPiBUaGFua3Ms
Cj4gPiBJYW4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJham5lc2ggS2Fud2FsIDxya2Fud2Fs
QHJpdm9zaW5jLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB0b29scy9wZXJmL3V0aWwvbWFjaGluZS5j
IHwgMjEgKysrKysrKysrKysrKystLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3BlcmYvdXRpbC9tYWNoaW5lLmMgYi90b29scy9wZXJmL3V0aWwvbWFjaGluZS5jCj4gPiA+IGlu
ZGV4IDI3ZDUzNDVkMmIzMC4uZjJlYjNjMjAyNzRlIDEwMDY0NAo+ID4gPiAtLS0gYS90b29scy9w
ZXJmL3V0aWwvbWFjaGluZS5jCj4gPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMK
PiA+ID4gQEAgLTIxNzQsMjUgKzIxNzQsMzIgQEAgc3RhdGljIHZvaWQgc2F2ZV9pdGVyYXRpb25z
KHN0cnVjdCBpdGVyYXRpb25zICppdGVyLAo+ID4gPiAgICAgICAgICAgICAgICAgaXRlci0+Y3lj
bGVzICs9IGJlW2ldLmZsYWdzLmN5Y2xlczsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gLSNkZWZpbmUg
Q0hBU0hTWiAxMjcKPiA+ID4gLSNkZWZpbmUgQ0hBU0hCSVRTIDcKPiA+ID4gLSNkZWZpbmUgTk9f
RU5UUlkgMHhmZgo+ID4gPiArI2RlZmluZSBDSEFTSEJJVFMgOAo+ID4gPiArI2RlZmluZSBOT19F
TlRSWSAweGZmVQo+ID4gPgo+ID4gPiAtI2RlZmluZSBQRVJGX01BWF9CUkFOQ0hfREVQVEggMTI3
Cj4gPiA+ICsjZGVmaW5lIFBFUkZfTUFYX0JSQU5DSF9ERVBUSCAyNTYKPiA+ID4KPiA+ID4gIC8q
IFJlbW92ZSBsb29wcy4gKi8KPiA+ID4gKy8qIE5vdGU6IExhc3QgZW50cnkgKGk9PWZmKSB3aWxs
IG5ldmVyIGJlIGNoZWNrZWQgYWdhaW5zdCBOT19FTlRSWQo+ID4gPiArICogc28gaXQncyBzYWZl
IHRvIGhhdmUgYW4gdW5zaWduZWQgY2hhciBhcnJheSB0byBwcm9jZXNzIDI1NiBlbnRyaWVzCj4g
PiA+ICsgKiB3aXRob3V0IGNhdXNpbmcgY2xhc2ggYmV0d2VlbiBsYXN0IGVudHJ5IGFuZCBOT19F
TlRSWSB2YWx1ZS4KPiA+ID4gKyAqLwo+ID4gPiAgc3RhdGljIGludCByZW1vdmVfbG9vcHMoc3Ry
dWN0IGJyYW5jaF9lbnRyeSAqbCwgaW50IG5yLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgaXRlcmF0aW9ucyAqaXRlcikKPiA+ID4gIHsKPiA+ID4gICAgICAgICBpbnQgaSwg
aiwgb2ZmOwo+ID4gPiAtICAgICAgIHVuc2lnbmVkIGNoYXIgY2hhc2hbQ0hBU0hTWl07Cj4gPiA+
ICsgICAgICAgdW5zaWduZWQgY2hhciBjaGFzaFtQRVJGX01BWF9CUkFOQ0hfREVQVEhdOwo+ID4g
Pgo+ID4gPiAgICAgICAgIG1lbXNldChjaGFzaCwgTk9fRU5UUlksIHNpemVvZihjaGFzaCkpOwo+
ID4gPgo+ID4gPiAtICAgICAgIEJVR19PTihQRVJGX01BWF9CUkFOQ0hfREVQVEggPiAyNTUpOwo+
ID4gPiArICAgICAgIEJVR19PTihQRVJGX01BWF9CUkFOQ0hfREVQVEggPiAyNTYpOwo+ID4gPgo+
ID4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucjsgaSsrKSB7Cj4gPiA+IC0gICAgICAgICAg
ICAgICBpbnQgaCA9IGhhc2hfNjQobFtpXS5mcm9tLCBDSEFTSEJJVFMpICUgQ0hBU0hTWjsKPiA+
ID4gKyAgICAgICAgICAgICAgIC8qIFJlbWFpbmRlciBkaXZpc2lvbiBieSBQRVJGX01BWF9CUkFO
Q0hfREVQVEggaXMgbm90Cj4gPiA+ICsgICAgICAgICAgICAgICAgKiBuZWVkZWQgYXMgaGFzaF82
NCB3aWxsIGFueXdheSBsaW1pdCB0aGUgaGFzaAo+ID4gPiArICAgICAgICAgICAgICAgICogdG8g
Q0hBU0hCSVRTCj4gPiA+ICsgICAgICAgICAgICAgICAgKi8KPiA+ID4gKyAgICAgICAgICAgICAg
IGludCBoID0gaGFzaF82NChsW2ldLmZyb20sIENIQVNIQklUUyk7Cj4gPiA+Cj4gPiA+ICAgICAg
ICAgICAgICAgICAvKiBubyBjb2xsaXNpb24gaGFuZGxpbmcgZm9yIG5vdyAqLwo+ID4gPiAgICAg
ICAgICAgICAgICAgaWYgKGNoYXNoW2hdID09IE5PX0VOVFJZKSB7Cj4gPiA+IC0tCj4gPiA+IDIu
MzQuMQo+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
