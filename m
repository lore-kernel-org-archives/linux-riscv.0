Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31B5C46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbZ6xhWW4Q0eXUZGukhlIXEGMsVIcVX8WIi2ufqTy7E=; b=nuFvgebNeiqeWg
	axvBoAg/nHzRHPExGA2oahiXB87iLeXbxEMjBDssDtvcEY/bP5JoyCZzheNJ1Ag9/Ah3i3EaYfPd2
	ye4YYLJvd11HkUJyS0QqLoiw7mgrvba39J3pFB2/6gj3mkZBJQdOwHddT+XvpNI6GsXdMNtCXZfy+
	Q8Ye5CUTF07pwradwBfMD+uQcfnlvdN0UJsvnzSG2BmPct6H03IKZtdODbRAknFDKitsCsGUAW60Q
	KuxDvt2CdCx8N+VnEuz3ratoxI8knBxjBvIQgQ3Lb0g+DjsObyRwtN+TIFWwyJts322BGs8r8zY7A
	HhhBWs0i6Z0Sy5FprayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGacy-005GuJ-2r;
	Fri, 22 Dec 2023 08:11:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGacv-005Gt1-2u
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 08:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5A62AB82200
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 08:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F17C433C8
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703232683;
	bh=xlvrw1s0T46Tz1knGooTW4HgxuEaVE6Yt4gVH7KsSNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ThJHIAWScS67tO4MPkBAG639WxhdKDyUoCbBibMIwOUCJSm4eLx5TYNjMlPfj2Euu
	 EZZnLtFeL/Vz0lhk12fZaMNiHJLD5uIN47v8qoOS9iemaIwTaQkpzKExUBNRIHy4nv
	 s4Jgd6KWl6FeJMwvuW/P+N4QQxpZnfiojXLU9BrQRcrO27M7kXtfGAenghgNeH6NRi
	 c0NuJM835BWWVGTGNChon2OX+8Ifb7UfIIzWBKh/tzF2905e2gt4q1MfBTAFZY1u3w
	 OV6Arg0gB3HvO3ovldS4JPJxJQV0jOhxwtJzGJ/DgFROvm0vwEXlkfUpxV76Qt2/uW
	 AROH4os7cmJAg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-552d39ac3ccso4901889a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 00:11:23 -0800 (PST)
X-Gm-Message-State: AOJu0YxV1LXEao1819UDCIB10RaVWcAVmZocLZUu00gKTTHUlubj0QEs
	jpe/QRktHLn+BRJmY7crc1HaSFLItb9JvPioKVs=
X-Google-Smtp-Source: AGHT+IG2QDqYm9J7T4aV4Gi9QMXZcNjKi+BwCgA9nxbLz37NE8zlLTmwMUaMZL0C8EpuHRmgEsm9wh+mRbWDQIvom3M=
X-Received: by 2002:a17:907:9392:b0:a25:a0c6:ebf5 with SMTP id
 cm18-20020a170907939200b00a25a0c6ebf5mr762193ejc.21.1703232682173; Fri, 22
 Dec 2023 00:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-5-leobras@redhat.com>
In-Reply-To: <20231222074605.452452-5-leobras@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 16:11:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTzOS+16d2sqLnRnw_bxVnE9Gudtf4nu69XbSsvcsQCfw@mail.gmail.com>
Message-ID: <CAJF2gTTzOS+16d2sqLnRnw_bxVnE9Gudtf4nu69XbSsvcsQCfw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] riscv: Introduce set_compat_task() in asm/compat.h
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Greg Ungerer <gerg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, David Hildenbrand <david@redhat.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_001126_208470_726DAFFC 
X-CRM114-Status: GOOD (  17.22  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMzo0N+KAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBJbiBvcmRlciB0byBoYXZlIGFsbCB0YXNrIGNvbXBhdCBi
aXQgYWNjZXNzIGRpcmVjdGx5IGluIGNvbXBhdC5oLCBpbnRyb2R1Y2UKPiBzZXRfY29tcGF0X3Rh
c2soKSB0byBzZXQvcmVzZXQgdGhvc2Ugd2hlbiBuZWVkZWQuCj4KPiBBbHNvLCBzaW5jZSBpdCdz
IG9ubHkgdXNlZCBvbiBhbiBpZi9lbHNlIHNjZW5hcmlvLCBzaW1wbGlmeSB0aGUgbWFjcm8gdXNp
bmcKPiBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaCB8IDggKysrKysr
KysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaCAgICB8IDUgKy0tLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY29tcGF0LmgKPiBpbmRleCBkYTRiMjhjZDAxYTk1Li5hYTEwMzUzMGE1YzgzIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gQEAgLTI4LDYgKzI4LDE0IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGlzX2NvbXBhdF90aHJlYWQoc3RydWN0IHRocmVhZF9pbmZvICp0aHJlYWQpCj4gICAgICAg
ICByZXR1cm4gdGVzdF90aV90aHJlYWRfZmxhZyh0aHJlYWQsIFRJRl8zMkJJVCk7Cj4gIH0KPgo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X2NvbXBhdF90YXNrKGJvb2wgaXNfY29tcGF0KQo+ICt7
Cj4gKyAgICAgICBpZiAoaXNfY29tcGF0KQo+ICsgICAgICAgICAgICAgICBzZXRfdGhyZWFkX2Zs
YWcoVElGXzMyQklUKTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgY2xlYXJfdGhy
ZWFkX2ZsYWcoVElGXzMyQklUKTsKPiArfQo+ICsKPiAgc3RydWN0IGNvbXBhdF91c2VyX3JlZ3Nf
c3RydWN0IHsKPiAgICAgICAgIGNvbXBhdF91bG9uZ190IHBjOwo+ICAgICAgICAgY29tcGF0X3Vs
b25nX3QgcmE7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCj4gaW5kZXggMmU4ODI1N2NhZmFlYS4uYzdhZWE3
ODg2ZDIyYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaAo+IEBAIC0xMzUsMTAgKzEzNSw3IEBAIGRv
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICAjaWZkZWYgQ09ORklHX0NPTVBBVAo+Cj4gICNkZWZpbmUgU0VUX1BFUlNPTkFMSVRZKGV4
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtZG8geyAgICBpZiAoKGV4
KS5lX2lkZW50W0VJX0NMQVNTXSA9PSBFTEZDTEFTUzMyKSAgICAgICAgICAgICAgXAo+IC0gICAg
ICAgICAgICAgICBzZXRfdGhyZWFkX2ZsYWcoVElGXzMyQklUKTsgICAgICAgICAgICAgICAgICAg
ICBcCj4gLSAgICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgY2xlYXJfdGhyZWFkX2ZsYWcoVElGXzMy
QklUKTsgICAgICAgICAgICAgICAgICAgXAo+ICtkbyB7ICAgc2V0X2NvbXBhdF90YXNrKChleCku
ZV9pZGVudFtFSV9DTEFTU10gPT0gRUxGQ0xBU1MzMik7ICBcCj4gICAgICAgICBpZiAocGVyc29u
YWxpdHkoY3VycmVudC0+cGVyc29uYWxpdHkpICE9IFBFUl9MSU5VWDMyKSAgIFwKPiAgICAgICAg
ICAgICAgICAgc2V0X3BlcnNvbmFsaXR5KFBFUl9MSU5VWCB8ICAgICAgICAgICAgICAgICAgICAg
XAo+ICAgICAgICAgICAgICAgICAgICAgICAgIChjdXJyZW50LT5wZXJzb25hbGl0eSAmICh+UEVS
X01BU0spKSk7ICBcCj4gLS0KPiAyLjQzLjAKPgpMR1RNCgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8
Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
