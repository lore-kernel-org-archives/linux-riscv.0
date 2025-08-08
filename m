Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACCBC87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 06:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5C3LfSpieH58UZMC6SGD8f2BSBUi01Z7+8WsBCReyJk=; b=chN/O9UVpRb9gB
	vHUjGV4KxLg2z12rckT90aJhMk9tSeoUpyCyiP3Wp59kEVmMBo7Lt3mswVTfx/Su3GD9dfzbstsJa
	YqO4vA3mAnjvXj6gojq1TrQPrUu3iyg6iUXl4HGZWuOzTnIP+Bg15Sh22xmzJs/vKRZfoMBsSDyNf
	TzX2ZxeL6aiO/xdL73QoUXqUtExWkByf/js3wPJCrjB5XVXJg8RH8tWT+AFne/WeWPAB7yPRdH+1b
	QBXJLdqBkIljQhc7mBoPyCzqZ/MzYpr/mBQSvQXearNaX9L6pQSKGtDE5IVrONijX31MY9o7IA9k6
	bQ7/XZK4P7SlIWOyhHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukGsv-000000027hY-0xo0;
	Fri, 08 Aug 2025 06:47:25 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukGqQ-000000027Sm-0Us6;
	Fri, 08 Aug 2025 06:44:51 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-33211f7f06eso18991241fa.2;
        Thu, 07 Aug 2025 23:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754635488; x=1755240288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bygktD0fqAfBcULD1cv//efBpJOrdPBFdY6zXSYR1E=;
        b=aBDLNQbpWZoCpWknX6/dhb+UOUQCjhHzP9bwT7OzRRSrtu/GpYgEc5xBa63JxQiqQ7
         GHzhcsUTKwCjIJHKvAWxrb+W3IcOHkOGQq8poo/FRjS0eagVu+I9g+j+lXeSbVRpFznb
         vuIhuCKvwVDfti7iD3K6ijTjb0NmAVHcLu+LnsaJLLsm7mS2XpXX1VGenpKo/+B6hYXh
         r9Hk6VipNDBVij7g3hjA7fULnoT9p1KJMKuZK0RCd7/nlw/yXxIUt1U3AGoh4Dc48vEs
         yuOJS6p4qTV8bsrjCg9i1Sl8smeC2nWvR17BBos5dLvt91sRh0qb/PXHqQJYPLhXyJdL
         6kEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754635488; x=1755240288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bygktD0fqAfBcULD1cv//efBpJOrdPBFdY6zXSYR1E=;
        b=FJIYyu9adTTg6x+sBfpbPSwMoyqT6ZOjtDCocV9CML0mgkYljSbyK5kFXjkYWPgPMJ
         UK4eRuLUoDEwNSuX4ZjKtbFOQbdytQoRw6LW2HS6MnSARMyOy1w4IwlNjqMtthqn9I+V
         Qo3yjmtMgYPWICIf8ROUZlZtGn4ho9/XDNQPsloNmolNG8VoQxZaMJ5GjeIwQxwxBqle
         zRY7AbxkLACZ4HIkr/tjlBa+ETslf7DxnlXLFu2e1qbwZdJ5RCI3xESei6UJvfJ29wTR
         sCXoekPmiZp/vrEEECdBF0AoHJHTpJztMe0441ZJsdLiNdiyBuyrHZQcoeXcRITiL3SM
         gdNA==
X-Forwarded-Encrypted: i=1; AJvYcCVn0l6OyL7iPe7LLJg3mfOTy/5INUf1YF5LIatFArhVD/n7WtN/Sjjv04GGcxJx9ANHsvkrfjKdFdsqowg=@lists.infradead.org, AJvYcCVuSuILmujaD4WZHelzc7vpNdWMWAuL6FCpXZXYE9JUBABxyTvaFJ06U0+xeppoC7vC1JvSd+RnvPqIbq976w4/@lists.infradead.org, AJvYcCXMqi3mCW3UUf4lQTBJoLnmklYJX9BtwNlvzswAm74NgTDcoOKPq4UAN+IpanpT1LHgGqDFIHdI0Hk=@lists.infradead.org
X-Gm-Message-State: AOJu0YynEg4AhTs6fYBhOY4fnvnm0Ur2JVZyoja7QATlVsv2Iu3qojCg
	UAdB4S6yQbVzV13cOs+30G4pda1BLIk9boscu7AX4U/jol0ZT8TJ6GYusI8yFTbAmisPVyq+NU7
	zIjuJp3wIJByDXxUanoqcDqtkrMp2wTg=
X-Gm-Gg: ASbGncuIAcCyMahE/pLoju6qvjvTdK2WncnhmuC4uzKwi6pcXsMDOvrvFFtdQe2HhjJ
	gFghuebRKudyonGJ0cscEAK/Z1kfbdbG+cHenwnzThbcVWa3/Zoks7mIzPFQA1lFHRI6K5ROfE0
	amBsGQhNhpyF++M2FgBXdjUU49lYVaX1SEqO6Avdj2B4BjYdGL6rArAZ8AS8w8HztpfhaFW6T2s
	lVisuI4GbmFwg==
X-Google-Smtp-Source: AGHT+IFs71M36/AELdEQHAnmGYL1flS4Z16XX46ZSXB/yJtln5z+7ajdXBk68gahFV3tPaDyZV4i3858ZjCNgBJDsz4=
X-Received: by 2002:a05:651c:4010:b0:332:2df3:f8ac with SMTP id
 38308e7fff4ca-333a222c31amr3330341fa.32.1754635487960; Thu, 07 Aug 2025
 23:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250807194012.631367-1-snovitoll@gmail.com> <20250807194012.631367-3-snovitoll@gmail.com>
 <07ffb27c-3416-43c9-a50a-164a76e5ab60@csgroup.eu>
In-Reply-To: <07ffb27c-3416-43c9-a50a-164a76e5ab60@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Fri, 8 Aug 2025 11:44:30 +0500
X-Gm-Features: Ac12FXy3j3jcHWv5quQse7L5XRgGZZuU0Dnwj-G3jWlUZ0ijDblLaDUsIz_V-Q8
Message-ID: <CACzwLxhahYWfRc5xKshayniV6SuFFnMT0NfHttippcASzZgtRw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] kasan: call kasan_init_generic in kasan_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>, alex@ghiti.fr
Cc: ryabinin.a.a@gmail.com, bhe@redhat.com, hca@linux.ibm.com, 
	andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.co, glider@google.com, 
	dvyukov@google.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, 
	elver@google.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_234450_159840_42B80D8D 
X-CRM114-Status: GOOD (  23.67  )
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

T24gRnJpLCBBdWcgOCwgMjAyNSBhdCAxMDowN+KAr0FNIENocmlzdG9waGUgTGVyb3kKPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+Cj4gTGUgMDcvMDgvMjAyNSDDoCAy
MTo0MCwgU2FieXJ6aGFuIFRhc2JvbGF0b3YgYSDDqWNyaXQgOgo+ID4gQ2FsbCBrYXNhbl9pbml0
X2dlbmVyaWMoKSB3aGljaCBoYW5kbGVzIEdlbmVyaWMgS0FTQU4gaW5pdGlhbGl6YXRpb24uCj4g
PiBGb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvIG5vdCBzZWxlY3QgQVJDSF9ERUZFUl9LQVNBTiwK
PiA+IHRoaXMgd2lsbCBiZSBhIG5vLW9wIGZvciB0aGUgcnVudGltZSBmbGFnIGJ1dCB3aWxsCj4g
PiBwcmludCB0aGUgaW5pdGlhbGl6YXRpb24gYmFubmVyLgo+ID4KPiA+IEZvciBTV19UQUdTIGFu
ZCBIV19UQUdTIG1vZGVzLCB0aGVpciByZXNwZWN0aXZlIGluaXQgZnVuY3Rpb25zIHdpbGwKPiA+
IGhhbmRsZSB0aGUgZmxhZyBlbmFibGluZywgaWYgdGhleSBhcmUgZW5hYmxlZC9pbXBsZW1lbnRl
ZC4KPiA+Cj4gPiBDbG9zZXM6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjE3MDQ5Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWJ5cnpoYW4gVGFzYm9sYXRvdiA8c25v
dml0b2xsQGdtYWlsLmNvbT4KPiA+IFRlc3RlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiAjIHJpc2N2Cj4gPiBBY2tlZC1ieTogQWxleGFuZGVyIEdvcmRlZXYg
PGFnb3JkZWV2QGxpbnV4LmlibS5jb20+ICMgczM5MAo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHY1
Ogo+ID4gLSBVbmlmaWVkIGFyY2ggcGF0Y2hlcyBpbnRvIGEgc2luZ2xlIG9uZSwgd2hlcmUgd2Ug
anVzdCBjYWxsCj4gPiAgICAgICBrYXNhbl9pbml0X2dlbmVyaWMoKQo+ID4gLSBBZGRlZCBUZXN0
ZWQtYnkgdGFnIGZvciByaXNjdiAodGVzdGVkIHRoZSBzYW1lIGNoYW5nZSBpbiB2NCkKPiA+IC0g
QWRkZWQgQWNrZWQtYnkgdGFnIGZvciBzMzkwICh0ZXN0ZWQgdGhlIHNhbWUgY2hhbmdlIGluIHY0
KQo+ID4gLS0tCj4gPiAgIGFyY2gvYXJtL21tL2thc2FuX2luaXQuYyAgICB8IDIgKy0KPiA+ICAg
YXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmMgIHwgNCArLS0tCj4gPiAgIGFyY2gvcmlzY3YvbW0v
a2FzYW5faW5pdC5jICB8IDEgKwo+ID4gICBhcmNoL3MzOTAva2VybmVsL2Vhcmx5LmMgICAgfCAz
ICsrLQo+ID4gICBhcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMgfCAyICstCj4gPiAgIGFyY2gv
eHRlbnNhL21tL2thc2FuX2luaXQuYyB8IDIgKy0KPiA+ICAgNiBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L21tL2thc2FuX2luaXQuYyBiL2FyY2gvYXJtL21tL2thc2FuX2luaXQuYwo+ID4gaW5kZXggMTEx
ZDRmNzAzMTMuLmM2NjI1ZTgwOGJmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm0vbW0va2FzYW5f
aW5pdC5jCj4gPiArKysgYi9hcmNoL2FybS9tbS9rYXNhbl9pbml0LmMKPiA+IEBAIC0zMDAsNiAr
MzAwLDYgQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+ID4gICAgICAgbG9jYWxfZmx1
c2hfdGxiX2FsbCgpOwo+ID4KPiA+ICAgICAgIG1lbXNldChrYXNhbl9lYXJseV9zaGFkb3dfcGFn
ZSwgMCwgUEFHRV9TSVpFKTsKPiA+IC0gICAgIHByX2luZm8oIktlcm5lbCBhZGRyZXNzIHNhbml0
aXplciBpbml0aWFsaXplZFxuIik7Cj4gPiAgICAgICBpbml0X3Rhc2sua2FzYW5fZGVwdGggPSAw
Owo+ID4gKyAgICAga2FzYW5faW5pdF9nZW5lcmljKCk7Cj4gPiAgIH0KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L21tL2thc2FuX2luaXQuYyBiL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5j
Cj4gPiBpbmRleCBkNTQxY2U0NWRhZS4uYWJlYjgxYmY2ZWIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L2FybTY0L21tL2thc2FuX2luaXQuYwo+ID4gKysrIGIvYXJjaC9hcm02NC9tbS9rYXNhbl9pbml0
LmMKPiA+IEBAIC0zOTksMTQgKzM5OSwxMiBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQp
Cj4gPiAgIHsKPiA+ICAgICAgIGthc2FuX2luaXRfc2hhZG93KCk7Cj4gPiAgICAgICBrYXNhbl9p
bml0X2RlcHRoKCk7Cj4gPiAtI2lmIGRlZmluZWQoQ09ORklHX0tBU0FOX0dFTkVSSUMpCj4gPiAr
ICAgICBrYXNhbl9pbml0X2dlbmVyaWMoKTsKPiA+ICAgICAgIC8qCj4gPiAgICAgICAgKiBHZW5l
cmljIEtBU0FOIGlzIG5vdyBmdWxseSBpbml0aWFsaXplZC4KPiA+ICAgICAgICAqIFNvZnR3YXJl
IGFuZCBIYXJkd2FyZSBUYWctQmFzZWQgbW9kZXMgc3RpbGwgcmVxdWlyZQo+ID4gICAgICAgICog
a2FzYW5faW5pdF9zd190YWdzKCkgYW5kIGthc2FuX2luaXRfaHdfdGFncygpIGNvcnJlc3BvbmRp
bmdseS4KPiA+ICAgICAgICAqLwo+ID4gLSAgICAgcHJfaW5mbygiS2VybmVsQWRkcmVzc1Nhbml0
aXplciBpbml0aWFsaXplZCAoZ2VuZXJpYylcbiIpOwo+ID4gLSNlbmRpZgo+ID4gICB9Cj4gPgo+
ID4gICAjZW5kaWYgLyogQ09ORklHX0tBU0FOX0dFTkVSSUMgfHwgQ09ORklHX0tBU0FOX1NXX1RB
R1MgKi8KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYyBiL2FyY2gv
cmlzY3YvbW0va2FzYW5faW5pdC5jCj4gPiBpbmRleCA0MWM2MzVkNmFjYS4uYmEyNzA5YjFlZWMg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYwo+ID4gKysrIGIvYXJj
aC9yaXNjdi9tbS9rYXNhbl9pbml0LmMKPiA+IEBAIC01MzAsNiArNTMwLDcgQEAgdm9pZCBfX2lu
aXQga2FzYW5faW5pdCh2b2lkKQo+ID4KPiA+ICAgICAgIG1lbXNldChrYXNhbl9lYXJseV9zaGFk
b3dfcGFnZSwgS0FTQU5fU0hBRE9XX0lOSVQsIFBBR0VfU0laRSk7Cj4gPiAgICAgICBpbml0X3Rh
c2sua2FzYW5fZGVwdGggPSAwOwo+ID4gKyAgICAga2FzYW5faW5pdF9nZW5lcmljKCk7Cj4KPiBJ
IHVuZGVyc3Rvb2QgS0FTQU4gaXMgcmVhbGx5IHJlYWR5IHRvIGZ1bmN0aW9uIG9ubHkgb25jZSB0
aGUgY3NyX3dyaXRlKCkKPiBhbmQgbG9jYWxfZmx1c2hfdGxiX2FsbCgpIGJlbG93IGFyZSBkb25l
LiBTaG91bGRuJ3Qga2FzYW5faW5pdF9nZW5lcmljKCkKPiBiZSBjYWxsZWQgYWZ0ZXIgaXQgPwoK
SSB3aWxsIHRyeSB0byB0ZXN0IHRoaXMgaW4gdjY6CgogICAgICAgIGNzcl93cml0ZShDU1JfU0FU
UCwgUEZOX0RPV04oX19wYShzd2FwcGVyX3BnX2RpcikpIHwgc2F0cF9tb2RlKTsKICAgICAgICBs
b2NhbF9mbHVzaF90bGJfYWxsKCk7CiAgICAgICAga2FzYW5faW5pdF9nZW5lcmljKCk7CgpBbGV4
YW5kcmUgR2hpdGkgc2FpZCBbMV0gaXQgd2FzIG5vdCBhIHByb2JsZW0sIGJ1dCBJIHdpbGwgY2hl
Y2suCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwYzFlNjU2LTUxMmUtNDQyNC05
ZDRlLTE3NmFmMThiYjdkNkBnaGl0aS5mci8KCj4KPiA+Cj4gPiAgICAgICBjc3Jfd3JpdGUoQ1NS
X1NBVFAsIFBGTl9ET1dOKF9fcGEoc3dhcHBlcl9wZ19kaXIpKSB8IHNhdHBfbW9kZSk7Cj4gPiAg
ICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2tl
cm5lbC9lYXJseS5jIGIvYXJjaC9zMzkwL2tlcm5lbC9lYXJseS5jCj4gPiBpbmRleCA5YWRmYmRk
Mzc3ZC4uNTQ0ZTU0MDNkZDkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3MzOTAva2VybmVsL2Vhcmx5
LmMKPiA+ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvZWFybHkuYwo+ID4gQEAgLTIxLDYgKzIxLDcg
QEAKPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gICAjaW5jbHVkZSA8YXNtL2Fz
bS1leHRhYmxlLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9tZW1ibG9jay5oPgo+ID4gKyNpbmNs
dWRlIDxsaW51eC9rYXNhbi5oPgo+ID4gICAjaW5jbHVkZSA8YXNtL2FjY2Vzcy1yZWdzLmg+Cj4g
PiAgICNpbmNsdWRlIDxhc20vYXNtLW9mZnNldHMuaD4KPiA+ICAgI2luY2x1ZGUgPGFzbS9tYWNo
aW5lLmg+Cj4gPiBAQCAtNjUsNyArNjYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5fZWFy
bHlfaW5pdCh2b2lkKQo+ID4gICB7Cj4gPiAgICNpZmRlZiBDT05GSUdfS0FTQU4KPiA+ICAgICAg
IGluaXRfdGFzay5rYXNhbl9kZXB0aCA9IDA7Cj4gPiAtICAgICBwcl9pbmZvKCJLZXJuZWxBZGRy
ZXNzU2FuaXRpemVyIGluaXRpYWxpemVkXG4iKTsKPiA+ICsgICAgIGthc2FuX2luaXRfZ2VuZXJp
YygpOwo+ID4gICAjZW5kaWYKPiA+ICAgfQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9t
bS9rYXNhbl9pbml0XzY0LmMgYi9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMKPiA+IGluZGV4
IDA1MzllZmQwZDIxLi45OThiNjAxMGQ2ZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2L21tL2th
c2FuX2luaXRfNjQuYwo+ID4gKysrIGIvYXJjaC94ODYvbW0va2FzYW5faW5pdF82NC5jCj4gPiBA
QCAtNDUxLDUgKzQ1MSw1IEBAIHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPiA+ICAgICAg
IF9fZmx1c2hfdGxiX2FsbCgpOwo+ID4KPiA+ICAgICAgIGluaXRfdGFzay5rYXNhbl9kZXB0aCA9
IDA7Cj4gPiAtICAgICBwcl9pbmZvKCJLZXJuZWxBZGRyZXNzU2FuaXRpemVyIGluaXRpYWxpemVk
XG4iKTsKPiA+ICsgICAgIGthc2FuX2luaXRfZ2VuZXJpYygpOwo+ID4gICB9Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC94dGVuc2EvbW0va2FzYW5faW5pdC5jIGIvYXJjaC94dGVuc2EvbW0va2FzYW5f
aW5pdC5jCj4gPiBpbmRleCBmMzljNGQ4MzE3My4uMDUyNGI5ZWQ1ZTYgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3h0ZW5zYS9tbS9rYXNhbl9pbml0LmMKPiA+ICsrKyBiL2FyY2gveHRlbnNhL21tL2th
c2FuX2luaXQuYwo+ID4gQEAgLTk0LDUgKzk0LDUgQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2
b2lkKQo+ID4KPiA+ICAgICAgIC8qIEF0IHRoaXMgcG9pbnQga2FzYW4gaXMgZnVsbHkgaW5pdGlh
bGl6ZWQuIEVuYWJsZSBlcnJvciBtZXNzYWdlcy4gKi8KPiA+ICAgICAgIGN1cnJlbnQtPmthc2Fu
X2RlcHRoID0gMDsKPiA+IC0gICAgIHByX2luZm8oIktlcm5lbEFkZHJlc3NTYW5pdGl6ZXIgaW5p
dGlhbGl6ZWRcbiIpOwo+ID4gKyAgICAga2FzYW5faW5pdF9nZW5lcmljKCk7Cj4gPiAgIH0KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
