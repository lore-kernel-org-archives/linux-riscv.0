Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED5CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 16:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2JstGlHQgOSmytGrKUwDqF5FWRMLpEqm4pdTg7Pnkk=; b=laeEgkRUYESuJ8
	aDgiRXTlfWjqVcsqSkBIOQmqmU8/FE5j/QW8KIN1wk/+hFcc13/0QOEuyINjV24FYummHi6I3rHG8
	Nll6EhO8oGKKRQo48hHxVAw5WuyocPDn5L0V101Z0fwcer2GLDiZTVw3UeC6eUBcEXhh1TWgBjqWC
	wti8r6xX7z1CHtCwpNJ9q5VV9+rYHnM3kr4x11uzEkNcx4du5nLc30KxiTpEfoNcK0NS3hiDE2D9y
	afkTsXWjCKw9Ufumgx8vINxKR2EEhoaWi6N4njehlxEi01aWC8/ZyHDtCLiYBbs+flNajWBOMqYAd
	a47P5xwlRvTQ9Adqhp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M6C-0000000Ap1q-0dr7;
	Thu, 02 Oct 2025 16:24:08 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M69-0000000Ap0e-2kpb
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 16:24:07 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so1405840a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 09:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422245; x=1760027045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG4UbihUbbBb4GvGu6r2xMfearc0gtsGkbk+C+0xE2o=;
        b=DWzFVeCmZPoLp6Duy2eO8cQx6wMilgBegrk+7+Ez5A1UAAiKgB2ozsgPXtzaGugNtf
         8guofN9V6LI42jH3mDQKiCCpPAJuv2mghJCHYo9Dqw3ptkyfQ4xXUNSK6HTZViMRvHLd
         5xVBjb9oCoBjRLE0IpajsWrNqadiC8MCodX2lfnfKsvdgNF64DjFXoc5PKJxn6iDzT0p
         9ayayua6mVnkuKj4As4OyTbjwEl8M2kqAPhsSfd28NnH4lMfKqHEjZg+SF/S2wf6b1WV
         6ZIOc+YCZT7BxWm9hJHZBs4eWYniGEKgMPzUXcqNlg7djYY0j71orU8qgXMnkEFiL/ks
         gxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422245; x=1760027045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FG4UbihUbbBb4GvGu6r2xMfearc0gtsGkbk+C+0xE2o=;
        b=wtEMcN+XLN5uXieoT1ACm7jUP2h+ZtIH60389pbMuUY5LsCdmPDb/zj3rYI5bC8O5+
         70TY/aiB7zbAlf0hG1K9w/foPj99tWfxTUMgVSXb4Tm5rlG8ipfw9HfVh2lRqmnciycG
         ITzptkYFasac05t2Q93FzESxNKGi41Gmuc4jXFuWUc/HRnxlGeci3B7xcyR8Dyjtfnqg
         9EVOW414x5e5m83VkDLhB6K4b1KCPpuIf4an4aDw4OmDUSTBA6XoeAeFQ/QmNfJDZ4XJ
         vXFhgjen9KTFrM2Dwwq13F9wztNipTQy8y8yqCXFIZDFblzlTPsm+zLT+A9AEU7S5e4X
         ZUVA==
X-Forwarded-Encrypted: i=1; AJvYcCUshVI3mSt2Q6MngskgcNQfEYPKgLdRb0vO01+Xu9qocXYmNjlAZnWPwgQaTqMiPCmNmrbWef1jeu/89g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq26ET4cOMUuiiAqARHP4yeCd2Q5zRhclGj8Cqy8JpT2TZFumM
	qyLcXVuh6RKytsqp0NHuCS+qQGq3ZzPLKjdUZqXBq/0TvuvqLjvFK8KTpN1A1lsEgQIqEr8YUUS
	PJ8i79+M/o2PP46q3e+KCpl2/Zw9g9Rc=
X-Gm-Gg: ASbGnctZWsRYgoR+pgx2WSpeyfhBKaKrYrpFjDs5SHEKFbDeQgSU0OG8ZXDEMSyW4K9
	Ei05KQGZZdwr/B/jm2T/kVyCVvTLgBdRwyDuvA73biOCzOjIG/kISgpNdnp663BvQvEbPPe1a2F
	QK6kCEpjFVorlXydJp262oZymrD0xqGcPicDPwX48ENIFFppZmOtx8i+ApmwOWeAXo4GhqHgle3
	hz3nnhIFn80nI26ku5Zu8nQ8j5vuR8=
X-Google-Smtp-Source: AGHT+IEvL2rOVyKEurjPCyNZ8bAYpWhfsrSOgGDEbic0Qar3tiz/lZDZg2G/FyqIR7ysbptk3YJBSCysa8pVQY4OV+E=
X-Received: by 2002:a17:90b:1b50:b0:32b:bac7:5a41 with SMTP id
 98e67ed59e1d1-339a6f78db8mr10173373a91.37.1759422244837; Thu, 02 Oct 2025
 09:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn> <20250820-riscv-altn-helper-wip-v1-2-c3c626c1f7e6@iscas.ac.cn>
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-2-c3c626c1f7e6@iscas.ac.cn>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:29:02 -0400
X-Gm-Features: AS18NWBy6l9AZ0sUiCbnZdHynQXPVRh8RBVZN4pNdo2bGD2DCQPVJ1Ix8nPZDM8
Message-ID: <CALC8CXdigEV4KWOv9-WOknxt8RD29mamBAUkw=5dDN_zeC7v6w@mail.gmail.com>
Subject: Re: [PATCH 2/6] riscv: pgtable: Convert to use_alternative_unlikely
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Vivian Wang <uwu@dram.page>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_092405_697687_10C3EEDA 
X-CRM114-Status: GOOD (  21.54  )
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

SSBzZWUgeW91IGhhdmUgYSB3b21hbidzIG5hbWUgIlZpdmlhbiI6IHNvIGFtIEkgdG8gYXNzdW1l
IHlvdSBhcmUgb25lCm9mIHRoZSBiZWxvdmVkICJ0cmFubmllcyIgbGludXMgdGhyZXcgYWxsIHRo
ZSBNQU1BTExMTEVFRSBoYWNrZXJzICh3aG8KaGVscGVkIGhpbSBmcm9tIDE5OTMtMjAwMy4uLjIw
MDgpIGZvcj8gT3IgYXJlIENoaW5hLXd1bWFucyBqdXN0IG1vcmUKY29tcGV0ZW50IHRoYW4gd2hp
dGVzPwoKT24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgOTo1MeKAr0FNIFZpdmlhbiBXYW5nIDx3YW5n
cnVpa2FuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPiBVc2UgdXNlX2FsdGVybmF0aXZlX3VubGlr
ZWx5KCkgdG8gY2hlY2sgZm9yIFJJU0NWX0lTQV9FWFRfU1ZWUFRDLAo+IHJlcGxhY2luZyB0aGUg
dXNlIG9mIGFzbSBnb3RvIHdpdGggQUxURVJOQVRJVkUuCj4KPiBUaGUgInVubGlrZWx5IiB2YXJp
YW50IGlzIHVzZWQgdG8gbWF0Y2ggdGhlIGJlaGF2aW9yIG9mIHRoZSBvcmlnaW5hbAo+IGltcGxl
bWVudGF0aW9uIHVzaW5nIEFMVEVSTkFUSVZFKCJub3AiLCAiaiAlbFtzdnZwdGNdIiwgLi4uKS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4K
PiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAxNSArKysrKysrLS0t
LS0tLS0KPiAgYXJjaC9yaXNjdi9tbS9wZ3RhYmxlLmMgICAgICAgICAgfCAyMiArKysrKysrKysr
LS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjAgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IGluZGV4IDkxNjk3ZmJmMWY5
MDEzMDA1ODAwZjcxMzc5N2U0YjZiMWZjOGQzMTIuLjgxZWIzODZkYTgzN2YwNjRjNzM3MjUzMGUy
ZjIyMjc1NzVhNzAzZDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC00OTUs
OCArNDk1LDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X2NhY2hlX3JhbmdlKHN0
cnVjdCB2bV9mYXVsdCAqdm1mLAo+ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ICAgICAgICAgICAgICAgICBwdGVfdCAq
cHRlcCwgdW5zaWduZWQgaW50IG5yKQo+ICB7Cj4gLSAgICAgICBhc20gZ290byhBTFRFUk5BVElW
RSgibm9wIiwgImogJWxbc3Z2cHRjXSIsIDAsIFJJU0NWX0lTQV9FWFRfU1ZWUFRDLCAxKQo+IC0g
ICAgICAgICAgICAgICAgOiA6IDogOiBzdnZwdGMpOwo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IFN2dnB0YyBndWFyYW50ZWVzIHRoYXQgdGhlIG5ldyB2YWxpZCBwdGUgd2lsbCBiZSB2aXNpYmxl
IHdpdGhpbgo+ICsgICAgICAgICogYSBib3VuZGVkIHRpbWVmcmFtZSwgc28gd2hlbiB0aGUgdWFy
Y2ggZG9lcyBub3QgY2FjaGUgaW52YWxpZAo+ICsgICAgICAgICogZW50cmllcywgd2UgZG9uJ3Qg
aGF2ZSB0byBkbyBhbnl0aGluZy4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKHVzZV9hbHRl
cm5hdGl2ZV91bmxpa2VseSgwLCBSSVNDVl9JU0FfRVhUX1NWVlBUQykpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybjsKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFRoZSBrZXJuZWwgYXNzdW1l
cyB0aGF0IFRMQnMgZG9uJ3QgY2FjaGUgaW52YWxpZCBlbnRyaWVzLCBidXQKPiBAQCAtNTA4LDEy
ICs1MTMsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgICAgICAgIHdoaWxlIChuci0tKQo+ICAgICAgICAgICAgICAg
ICBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyZXNzICsgbnIgKiBQQUdFX1NJWkUpOwo+Cj4gLXN2
dnB0Yzo7Cj4gLSAgICAgICAvKgo+IC0gICAgICAgICogU3Z2cHRjIGd1YXJhbnRlZXMgdGhhdCB0
aGUgbmV3IHZhbGlkIHB0ZSB3aWxsIGJlIHZpc2libGUgd2l0aGluCj4gLSAgICAgICAgKiBhIGJv
dW5kZWQgdGltZWZyYW1lLCBzbyB3aGVuIHRoZSB1YXJjaCBkb2VzIG5vdCBjYWNoZSBpbnZhbGlk
Cj4gLSAgICAgICAgKiBlbnRyaWVzLCB3ZSBkb24ndCBoYXZlIHRvIGRvIGFueXRoaW5nLgo+IC0g
ICAgICAgICovCj4gIH0KPiAgI2RlZmluZSB1cGRhdGVfbW11X2NhY2hlKHZtYSwgYWRkciwgcHRl
cCkgXAo+ICAgICAgICAgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShOVUxMLCB2bWEsIGFkZHIsIHB0
ZXAsIDEpCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vcGd0YWJsZS5jIGIvYXJjaC9yaXNj
di9tbS9wZ3RhYmxlLmMKPiBpbmRleCA4YjZjMGExMTJhOGRiNGU5MWRlNTRjM2JkM2JkNTI3YTYw
NWE2MTk3Li5lMGM0MTRmYTBkNDMzZmRjMzljODBlYzM5MGM0NjdjYTU5YTlhMzM0IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvbW0vcGd0YWJsZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9wZ3Rh
YmxlLmMKPiBAQCAtOSw4ICs5LDE2IEBAIGludCBwdGVwX3NldF9hY2Nlc3NfZmxhZ3Moc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIGFkZHJlc3MsIHB0ZV90ICpwdGVwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHRlX3QgZW50cnksIGludCBkaXJ0eSkKPiAgewo+IC0gICAgICAgYXNtIGdvdG8oQUxURVJOQVRJ
VkUoIm5vcCIsICJqICVsW3N2dnB0Y10iLCAwLCBSSVNDVl9JU0FfRVhUX1NWVlBUQywgMSkKPiAt
ICAgICAgICAgICAgICAgIDogOiA6IDogc3Z2cHRjKTsKPiArICAgICAgIGlmICh1c2VfYWx0ZXJu
YXRpdmVfdW5saWtlbHkoMCwgUklTQ1ZfSVNBX0VYVF9TVlZQVEMpKSB7Cj4gKyAgICAgICAgICAg
ICAgIGlmICghcHRlX3NhbWUocHRlcF9nZXQocHRlcCksIGVudHJ5KSkgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIF9fc2V0X3B0ZV9hdCh2bWEtPnZtX21tLCBwdGVwLCBlbnRyeSk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgLyogSGVyZSBvbmx5IG5vdCBzdmFkdSBpcyBpbXBhY3RlZCAq
Lwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX3RsYl9wYWdlKHZtYSwgYWRkcmVzcyk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKyAgICAgICAgICAgICAg
IH0KPiArCj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAgICAgIH0KPgo+ICAg
ICAgICAgaWYgKCFwdGVfc2FtZShwdGVwX2dldChwdGVwKSwgZW50cnkpKQo+ICAgICAgICAgICAg
ICAgICBfX3NldF9wdGVfYXQodm1hLT52bV9tbSwgcHRlcCwgZW50cnkpOwo+IEBAIC0xOSwxNiAr
MjcsNiBAQCBpbnQgcHRlcF9zZXRfYWNjZXNzX2ZsYWdzKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLAo+ICAgICAgICAgICogdGhlIGNhc2UgdGhhdCB0aGUgUFRFIGNoYW5nZWQgYW5kIHRoZSBz
cHVyaW91cyBmYXVsdCBjYXNlLgo+ICAgICAgICAgICovCj4gICAgICAgICByZXR1cm4gdHJ1ZTsK
PiAtCj4gLXN2dnB0YzoKPiAtICAgICAgIGlmICghcHRlX3NhbWUocHRlcF9nZXQocHRlcCksIGVu
dHJ5KSkgewo+IC0gICAgICAgICAgICAgICBfX3NldF9wdGVfYXQodm1hLT52bV9tbSwgcHRlcCwg
ZW50cnkpOwo+IC0gICAgICAgICAgICAgICAvKiBIZXJlIG9ubHkgbm90IHN2YWR1IGlzIGltcGFj
dGVkICovCj4gLSAgICAgICAgICAgICAgIGZsdXNoX3RsYl9wYWdlKHZtYSwgYWRkcmVzcyk7Cj4g
LSAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+IC0gICAgICAgfQo+IC0KPiAtICAgICAgIHJl
dHVybiBmYWxzZTsKPiAgfQo+Cj4gIGludCBwdGVwX3Rlc3RfYW5kX2NsZWFyX3lvdW5nKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+Cj4gLS0KPiAyLjUwLjEKPgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
