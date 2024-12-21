Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F19E77184
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 06:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ee6GlXQ7SyKdASimYqv1f9PjhogS/HLBN91SmVpd6gs=; b=AS3W0bMw80kBez
	ucUMf5BKyGgpfLRKSObUY7+FZ1+likPMwwQWs9vEUynVKFJIPA8x3VVcAXmEslJWpfrIE+Q8kFLLH
	cpST3cjquJTD5h7EEj9XibACaYSgs38M9g2dPuwZzWxvu/bQPYRCIQ3kuXAsEWPPA8FYWR6diK6ZJ
	4fOIP7O5HRZtJdOsuAnff9gJJPg8AQ6gT1fPQf5wL2sGmfOK6nbmarOxb9DCFFYvzMJ73gyE3lD+E
	M3QGw7/X5EE4cGGO3aHgVp/vPh13ZbxriTANP+wXRa5HwrCKb0N4RWLfhx2GmT3SRRAbqXwXM5KLc
	/GXz1sesUyVdoX1+J15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOtJR-00000006enF-43LH;
	Sat, 21 Dec 2024 06:50:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOtJO-00000006ema-3Zpj
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 06:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69B575C4319
	for <linux-riscv@lists.infradead.org>; Sat, 21 Dec 2024 06:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994F2C4CEE5
	for <linux-riscv@lists.infradead.org>; Sat, 21 Dec 2024 06:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734763805;
	bh=aPT/vUsqDrr6wIqMaA6El9GyLb63i2nePKY/bbBGnZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vOHUEYf3dUmiv8aabb+OoJ8GPvs3bM6R9YurvOddHC6HLfe1LCZ6Zy/b8eCdccSOR
	 SiHeaILbk3z+uriQR5Q9Etf/2xvHROPG6KB4NU47UeD51GwcrAdFQOpQE22SN7zc2C
	 j+HkIR63OpcM3yxt0zhm7QpAg2xQ2kXASg3JyT5Lp50D4EiZF+odZvERc1PUMVaI2W
	 cf42rhdoUOGTc2ry7O0snqKPlqIsR1acD/9hqAVSXfXPiUPF+n0ta2DSVRhVmtetPr
	 3ncEuZwQHbK5JbzZFd62LXWJxZx5P0o/Cy+G/527ZP8ir252uBl+ggjctH3IPUSf/T
	 1FJp8fibmJGJA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so3819308e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 22:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8sGaOmC9EiyP7eCPpQlXC+hXbjveJjEe4/UMN5XbYg+lm5L+qG4NiqaISapviYbQaSTV7QLrjD7C77g==@lists.infradead.org
X-Gm-Message-State: AOJu0YznABeRa7/xyFZoyFLipfE670C6EXlzTAXtKYPfDe5S7+2fTpIV
	o7dcfTKcKzHPojplL6ljhYQ1pU8HhVaTFKSeLLPnDebPClpIkJK3w5wfhG8nzUKxOb5fzwlghvl
	/MkyXGcMt9KVhErbqmlaDDySH+RM=
X-Google-Smtp-Source: AGHT+IEXQFYdtx5Oa0faHkLlK/I2FTVMe0Q27gL7GyYlEMngAiJ96rXV/jhes7CRQcuUuc1jLOX6TQVuUn3WEN3gSQw=
X-Received: by 2002:a05:6512:159d:b0:540:2fd2:6b85 with SMTP id
 2adb3069b0e04-542294509efmr1870468e87.13.1734763804035; Fri, 20 Dec 2024
 22:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 21 Dec 2024 15:49:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZLu89uSFrt9=_kEqWpZra_06VDQgOKuKKUiNqM9NJqg@mail.gmail.com>
Message-ID: <CAK7LNASZLu89uSFrt9=_kEqWpZra_06VDQgOKuKKUiNqM9NJqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-security-module@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_225007_000352_827AC5DF 
X-CRM114-Status: GOOD (  23.78  )
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

T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgODoxM+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gU2ltaWxhciB0byBsZC12ZXJzaW9uLCBhZGQgYSB3
YXkgdG8gY2hlY2sgdGhlIHZlcnNpb24gb2Ygb2JqZHVtcC4gVGhpcwo+IHNob3VsZCBtb3N0IG9m
IHRoZSB0aW1lIGVuZCB1cCBiZWluZyB0aGUgYmludXRpbHMgdmVyc2lvbiBvciB0aGUgbGx2bQo+
IHZlcnNpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPgoKVGhpcyBwYXRjaCBoYXMgbm8gcG9pbnQgYmVjYXVzZSAyLzIgaW5jbHVkZXMg
Q09ORklHIG9wdGlvbgpmcm9tIHRoZSB1c2Vyc3BhY2UgInBlcmYiLgoKCgoKPiAtLS0KPiAgaW5p
dC9LY29uZmlnICAgICAgICAgICAgICAgfCAxMCArKysrKysrCj4gIHNjcmlwdHMvS2NvbmZpZy5p
bmNsdWRlICAgIHwgIDYgKysrKwo+ICBzY3JpcHRzL29iamR1bXAtdmVyc2lvbi5zaCB8IDY5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBj
aGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5pdC9LY29uZmlnIGIv
aW5pdC9LY29uZmlnCj4gaW5kZXggYTIwZTZlZmQzZjBmYmRkN2YwZGYyNDQ4ODU0Y2MzMDczNGEw
ZWU0Zi4uMGI1ZDM2ZjkzOWUxZGU4OWMxMmViZGQ2MWU0ODE1MDE1MzE0ZDRmMSAxMDA2NDQKPiAt
LS0gYS9pbml0L0tjb25maWcKPiArKysgYi9pbml0L0tjb25maWcKPiBAQCAtNjAsNiArNjAsMTYg
QEAgY29uZmlnIExMRF9WRVJTSU9OCj4gICAgICAgICBkZWZhdWx0ICQobGQtdmVyc2lvbikgaWYg
TERfSVNfTExECj4gICAgICAgICBkZWZhdWx0IDAKPgo+ICtjb25maWcgT0JKRFVNUF9JU19HTlUK
PiArICAgICAgIGRlZl9ib29sICQoc3VjY2Vzcyx0ZXN0ICIkKG9iamR1bXAtbmFtZSkiID0gb2Jq
ZHVtcCkKPiArCj4gK2NvbmZpZyBPQkpEVU1QX0lTX0xMVk0KPiArICAgICAgIGRlZl9ib29sICQo
c3VjY2Vzcyx0ZXN0ICIkKG9iamR1bXAtbmFtZSkiID0gbGx2bS1vYmpkdW1wKQo+ICsKPiArY29u
ZmlnIE9CSkRVTVBfVkVSU0lPTgo+ICsgICAgICAgaW50Cj4gKyAgICAgICBkZWZhdWx0ICQob2Jq
ZHVtcC12ZXJzaW9uKQo+ICsKPiAgY29uZmlnIFJVU1RDX1ZFUlNJT04KPiAgICAgICAgIGludAo+
ICAgICAgICAgZGVmYXVsdCAkKHJ1c3RjLXZlcnNpb24pCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMv
S2NvbmZpZy5pbmNsdWRlIGIvc2NyaXB0cy9LY29uZmlnLmluY2x1ZGUKPiBpbmRleCAzMzE5M2Nh
NmU4MDMwZTY1OWQ2YjMyMWFjYWVhMWFjZDQyYzM4N2E0Li5jYjNlMmQyNTY0ZmVhOGNjZTc4MGFk
YjNiZTY3MmM5NTk2YjdjY2YyIDEwMDY0NAo+IC0tLSBhL3NjcmlwdHMvS2NvbmZpZy5pbmNsdWRl
Cj4gKysrIGIvc2NyaXB0cy9LY29uZmlnLmluY2x1ZGUKPiBAQCAtNTgsNiArNTgsMTIgQEAgJChl
cnJvci1pZiwkKHN1Y2Nlc3MsdGVzdCAteiAiJChsZC1pbmZvKSIpLFNvcnJ5JChjb21tYSkgdGhp
cyBsaW5rZXIgaXMgbm90IHN1cHAKPiAgbGQtbmFtZSA6PSAkKHNoZWxsLHNldCAtLSAkKGxkLWlu
Zm8pICYmIGVjaG8gJDEpCj4gIGxkLXZlcnNpb24gOj0gJChzaGVsbCxzZXQgLS0gJChsZC1pbmZv
KSAmJiBlY2hvICQyKQo+Cj4gKyMgR2V0IHRoZSBvYmpkdW1wIG5hbWUsIHZlcnNpb24sIGFuZCBl
cnJvciBvdXQgaWYgaXQgaXMgbm90IHN1cHBvcnRlZC4KPiArb2JqZHVtcC1pbmZvIDo9ICQoc2hl
bGwsJChzcmN0cmVlKS9zY3JpcHRzL29iamR1bXAtdmVyc2lvbi5zaCAkKE9CSkRVTVApKQo+ICsk
KGVycm9yLWlmLCQoc3VjY2Vzcyx0ZXN0IC16ICIkKG9iamR1bXAtaW5mbykiKSxTb3JyeSQoY29t
bWEpIHRoaXMgb2JqZHVtcCBpcyBub3Qgc3VwcG9ydGVkLikKPiArb2JqZHVtcC1uYW1lIDo9ICQo
c2hlbGwsc2V0IC0tICQob2JqZHVtcC1pbmZvKSAmJiBlY2hvICQxKQo+ICtvYmpkdW1wLXZlcnNp
b24gOj0gJChzaGVsbCxzZXQgLS0gJChvYmpkdW1wLWluZm8pICYmIGVjaG8gJDIpCj4gKwo+ICAj
IG1hY2hpbmUgYml0IGZsYWdzCj4gICMgICQobTMyLWZsYWcpOiAtbTMyIGlmIHRoZSBjb21waWxl
ciBzdXBwb3J0cyBpdCwgb3IgYW4gZW1wdHkgc3RyaW5nIG90aGVyd2lzZS4KPiAgIyAgJChtNjQt
ZmxhZyk6IC1tNjQgaWYgdGhlIGNvbXBpbGVyIHN1cHBvcnRzIGl0LCBvciBhbiBlbXB0eSBzdHJp
bmcgb3RoZXJ3aXNlLgo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL29iamR1bXAtdmVyc2lvbi5zaCBi
L3NjcmlwdHMvb2JqZHVtcC12ZXJzaW9uLnNoCj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRl
eCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi5mYTI0ZjhkYzJkM2M0
MmZkMTE5NWZjZWIzYzk2YjI3ZjcxMjdkYjI1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Njcmlw
dHMvb2JqZHVtcC12ZXJzaW9uLnNoCj4gQEAgLTAsMCArMSw2OSBAQAo+ICsjIS9iaW4vc2gKPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsjCj4gKyMgUHJpbnQgdGhlIG9i
amR1bXAgbmFtZSBhbmQgaXRzIHZlcnNpb24gaW4gYSA1IG9yIDYtZGlnaXQgZm9ybS4KPiArIyBB
bHNvLCBwZXJmb3JtIHRoZSBtaW5pbXVtIHZlcnNpb24gY2hlY2suCj4gKwo+ICtzZXQgLWUKPiAr
Cj4gKyMgQ29udmVydCB0aGUgdmVyc2lvbiBzdHJpbmcgeC55LnogdG8gYSBjYW5vbmljYWwgNSBv
ciA2LWRpZ2l0IGZvcm0uCj4gK2dldF9jYW5vbmljYWxfdmVyc2lvbigpCj4gK3sKPiArICAgICAg
IElGUz0uCj4gKyAgICAgICBzZXQgLS0gJDEKPiArCj4gKyAgICAgICAjIElmIHRoZSAybmQgb3Ig
M3JkIGZpZWxkIGlzIG1pc3NpbmcsIGZpbGwgaXQgd2l0aCBhIHplcm8uCj4gKyAgICAgICAjCj4g
KyAgICAgICAjIFRoZSA0dGggZmllbGQsIGlmIHByZXNlbnQsIGlzIGlnbm9yZWQuCj4gKyAgICAg
ICAjIFRoaXMgb2NjdXJzIGluIGRldmVsb3BtZW50IHNuYXBzaG90cyBhcyBpbiAyLjM1LjEuMjAy
MDExMTYKPiArICAgICAgIGVjaG8gJCgoMTAwMDAgKiAkMSArIDEwMCAqICR7MjotMH0gKyAkezM6
LTB9KSkKPiArfQo+ICsKPiArb3JpZ19hcmdzPSIkQCIKPiArCj4gKyMgR2V0IHRoZSBmaXJzdCBs
aW5lIG9mIHRoZSAtLXZlcnNpb24gb3V0cHV0Lgo+ICtJRlM9Jwo+ICsnCj4gK3NldCAtLSAkKExD
X0FMTD1DICIkQCIgLS12ZXJzaW9uKQo+ICsKPiArIyBTcGxpdCB0aGUgbGluZSBvbiBzcGFjZXMu
Cj4gK0lGUz0nICcKPiArc2V0IC0tICQxCj4gKwo+ICttaW5fdG9vbF92ZXJzaW9uPSQoZGlybmFt
ZSAkMCkvbWluLXRvb2wtdmVyc2lvbi5zaAo+ICsKPiAraWYgWyAiJDEiID0gR05VIC1hICIkMiIg
PSBvYmpkdW1wIF07IHRoZW4KPiArICAgICAgIHNoaWZ0ICQoKCQjIC0gMSkpCj4gKyAgICAgICB2
ZXJzaW9uPSQxCj4gKyAgICAgICBtaW5fdmVyc2lvbj0kKCRtaW5fdG9vbF92ZXJzaW9uIGJpbnV0
aWxzKQo+ICsgICAgICAgZGlzcF9uYW1lPSJHTlUgb2JqZHVtcCIKPiArZWxzZQo+ICsgICAgICAg
d2hpbGUgWyAkIyAtZ3QgMSAtYSAiJDEiICE9ICJMTFZNIiBdOyBkbwo+ICsgICAgICAgICAgICAg
ICBzaGlmdAo+ICsgICAgICAgZG9uZQo+ICsKPiArICAgICAgIGlmIFsgIiQxIiA9IExMVk0gXTsg
dGhlbgo+ICsgICAgICAgICAgICAgICB2ZXJzaW9uPSQzCj4gKyAgICAgICAgICAgICAgIG1pbl92
ZXJzaW9uPSQoJG1pbl90b29sX3ZlcnNpb24gbGx2bSkKPiArICAgICAgICAgICAgICAgZGlzcF9u
YW1lPSJsbHZtLW9iamR1bXAiCj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIGVjaG8g
IiRvcmlnX2FyZ3M6IHVua25vd24gb2JqZHVtcCIgPiYyCj4gKyAgICAgICAgICAgICAgIGV4aXQg
MQo+ICsgICAgICAgZmkKPiArZmkKPiArCj4gK3ZlcnNpb249JHt2ZXJzaW9uJSVbITAtOS5dKn0K
PiArCj4gK2N2ZXJzaW9uPSQoZ2V0X2Nhbm9uaWNhbF92ZXJzaW9uICR2ZXJzaW9uKQo+ICttaW5f
Y3ZlcnNpb249JChnZXRfY2Fub25pY2FsX3ZlcnNpb24gJG1pbl92ZXJzaW9uKQo+ICsKPiAraWYg
WyAiJGN2ZXJzaW9uIiAtbHQgIiRtaW5fY3ZlcnNpb24iIF07IHRoZW4KPiArICAgICAgIGVjaG8g
PiYyICIqKioiCj4gKyAgICAgICBlY2hvID4mMiAiKioqIG9iamR1bXAgaXMgdG9vIG9sZC4iCj4g
KyAgICAgICBlY2hvID4mMiAiKioqICAgWW91ciAkZGlzcF9uYW1lIHZlcnNpb246ICAgICR2ZXJz
aW9uIgo+ICsgICAgICAgZWNobyA+JjIgIioqKiAgIE1pbmltdW0gJGRpc3BfbmFtZSB2ZXJzaW9u
OiAkbWluX3ZlcnNpb24iCj4gKyAgICAgICBlY2hvID4mMiAiKioqIgo+ICsgICAgICAgZXhpdCAx
Cj4gK2ZpCj4gKwo+ICtlY2hvIG9iamR1bXAgJGN2ZXJzaW9uCj4KPiAtLQo+IDIuMzQuMQo+CgoK
LS0KQmVzdCBSZWdhcmRzCgoKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
