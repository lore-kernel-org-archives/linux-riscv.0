Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED9C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCVPEhITlthefg1WENVvxEsIzaEHj4pUWhAiZQURzww=; b=EQ243slKPvXAqi
	4L9m35gSQs4Omw2axQBfvaOQKUaYTWpQ5DbpPyDLiNMOI8EH5ioOvDhS2DA+xQZs759MSK84pYxMH
	gn6zDpVCSBi4dSAJgxInE1WbD4+InCb7/j8kE/xXnbB+2k1r2eyAPC3RJyoMlMSGfLPEG+Ss8TgiB
	rtewEwyrYj5tFkphTDdzS1xCqt+7CWTenJ91JICPJwIfRSNeOua0QElvwuTPskmL4iGq4hzDqhX6b
	yyQkSrEQXQ8F6bTLdnDeVaNn55w16Y2tE4eChg/OnLgfj3j0uLmC2eR0youIGAhGe2b865odc8PLr
	e9VkTg1JErtiBgrl0kUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTfmB-0000000A6Uu-10bs;
	Tue, 16 Jul 2024 10:51:19 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTfm7-0000000A6U8-3Dcy
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 10:51:17 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-383dfcd8cdfso19976745ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1721127074; x=1721731874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SOtGr51pErFpahsrrtYqkp40ybrWdij71XCYB1jqEQ=;
        b=NKMTg3HQia0ZQvHPtfpPwt+natJnPKg5TdkyrQ2/q9VRAxLWvHXQBt2NNfhAE6tKec
         hrGnWq8ZDKxV7lT8O/dT7T/TqiFz+zJ9F0YUyD5uM8Fhb23IiW5YM7UPRINiUi5OxEnF
         DqKDC6GIx0D0SFssfvXSkUpuypbQNUHrQmXIZwm620k3Xi7BRKCJJqrFnXVmB9Mg7Mvc
         YtpBO1pTkSj0edDt6BirwTMAiPS1iqzYDr9SKgYy5k/94LPPMLUpC6muMHyrJ0pCZ8+8
         4rTKUv80eVFHsFDNh2D5zkIPB4MpK02KAUlLHXsvjilL0SOUxP03Q8/Uig82og2F791A
         8D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721127074; x=1721731874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SOtGr51pErFpahsrrtYqkp40ybrWdij71XCYB1jqEQ=;
        b=BvmiYquqNL0PmSAiktjojA8s9supdoDhYqg2aBBx3P73Qw9kXY23iDd4xI1ufi/L07
         Vw4Ysg2QmO7BflviltP2MZ7dily7dGsyV8FXlN5etmOFw2atnvYXtY6R2U6/LmZ1118E
         gJ5HGcUmFqwYGC7K480WzkgFntiZBRnzfdHm9FLARpjfNhHOOiMSmylITGsVVGV5HNpi
         1LvciY7LMcH2Hx3MQNN9p/rJqxFCgnM0SGuJoWtL0EUnlsleh6O/6WcHnsxO5txEjGN9
         AfqPTqEIt9jtvP+3NYQt1ksXA7HVHP/YcOKErE0XJwOVodTsKQLZkdiltMFmLwJfNsLp
         38eg==
X-Forwarded-Encrypted: i=1; AJvYcCXoU2wqtT6nxe0qtQQMhTnf9yE6Mx9EtzUR8J76zmGQI7AIsmga7CdE43SQHet8znFYsFj7lUCqfx8SJlkYhymLdqFzTxhLKfs+wT+Q2+g8
X-Gm-Message-State: AOJu0YzAo39ePD568bKHu82Cd5xYjXVp8zWpyHdd2yS6JZEWvL3PgwOh
	3n+8m/1l8hZ9pPAeDyUQl4OjQbeY9aKINYWZyRU9R9lb4rjkOKzdvdIzPh5PmwOXIeO7C6YqgVt
	sIFt5IBTHPyql9KHLxGnosXZ4kDbRQ6IZqey64Q==
X-Google-Smtp-Source: AGHT+IFgLgr7BH1UuGGVhx6H0o4guImRTlhd3fKWbpAvzMa5o4ntPygEZJHxgQXzcZZOiJZ5wZoNNfFdR2dzx/sgAYs=
X-Received: by 2002:a92:c56a:0:b0:375:aaaf:e88f with SMTP id
 e9e14a558f8ab-393d2c94bebmr24128255ab.27.1721127074278; Tue, 16 Jul 2024
 03:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240716090521.1752166-1-nick.hu@sifive.com>
In-Reply-To: <20240716090521.1752166-1-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Jul 2024 16:21:02 +0530
Message-ID: <CAAhSdy1pjg=etzNNu-E+-VDmU5gLkS2jYhdO29pPN23OQ5=NiA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable the IPI before workqueue_online_cpu()
To: Nick Hu <nick.hu@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, peterz@infradead.org, samuel.holland@sifive.com, 
	tj@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_035116_093672_AA991781 
X-CRM114-Status: GOOD (  17.45  )
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

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMjozNeKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBTb21ldGltZXMgdGhlIGhvdHBsdWcgY3B1IHN0YWxscyBhdCB0aGUg
YXJjaF9jcHVfaWRsZSgpIGZvciBhIHdoaWxlIGFmdGVyCj4gd29ya3F1ZXVlX29ubGluZV9jcHUo
KS4gV2hlbiBjcHUgc3RhbGxzIGF0IHRoZSBpZGxlIGxvb3AsIHRoZSByZXNjaGVkdWxlCj4gSVBJ
IGlzIHBlbmRpbmcuIEhvd2V2ZXIgdGhlIGVuYWJsZSBiaXQgaXMgbm90IGVuYWJsZWQgeWV0IHNv
IHRoZSBjcHUgc3RhbGxzCj4gYXQgV0ZJIHVudGlsIHdhdGNoZG9nIHRpbWVvdXQuIFRoZXJlZm9y
ZSBlbmFibGUgdGhlIElQSSBiZWZvcmUgdGhlCj4gd29ya3F1ZXVlX29ubGluZV9jcHUoKSB0byBm
aXggdGhlIGlzc3VlLgo+Cj4gRml4ZXM6IDYzYzU0ODRlNzQ5NSAoIndvcmtxdWV1ZTogQWRkIG11
bHRpcGxlIGFmZmluaXR5IHNjb3BlcyBhbmQgaW50ZXJmYWNlIHRvIHNlbGVjdCB0aGVtIikKPiBT
aWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gv
cmlzY3Yva2VybmVsL3NiaS1pcGkuYyB8IDIgKy0KPiAgaW5jbHVkZS9saW51eC9jcHVob3RwbHVn
LmggIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gaW5kZXggMTAyNmUyMjk1NWNjLi5lMDVlNjhkZTg4NzEg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLWlwaS5jCj4gQEAgLTcxLDcgKzcxLDcgQEAgdm9pZCBfX2luaXQgc2Jp
X2lwaV9pbml0KHZvaWQpCj4gICAgICAgICAgKiB0aGUgbWFza2luZy91bm1hc2tpbmcgb2Ygdmly
dHVhbCBJUElzIGlzIGRvbmUKPiAgICAgICAgICAqIHZpYSBnZW5lcmljIElQSS1NdXgKPiAgICAg
ICAgICAqLwo+IC0gICAgICAgY3B1aHBfc2V0dXBfc3RhdGUoQ1BVSFBfQVBfT05MSU5FX0RZTiwK
PiArICAgICAgIGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQX0lSUV9SSVNDVl9TV0lOVF9TVEFS
VElORywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICJpcnFjaGlwL3NiaS1pcGk6c3RhcnRp
bmciLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpX2lwaV9zdGFydGluZ19jcHUsIE5V
TEwpOwo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY3B1aG90cGx1Zy5oIGIvaW5jbHVk
ZS9saW51eC9jcHVob3RwbHVnLmgKPiBpbmRleCA3YTU3ODVmNDA1YjYuLjU3ZGNmMTIyOWIyNyAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2NwdWhvdHBsdWcuaAo+ICsrKyBiL2luY2x1ZGUv
bGludXgvY3B1aG90cGx1Zy5oCj4gQEAgLTE0Nyw2ICsxNDcsNyBAQCBlbnVtIGNwdWhwX3N0YXRl
IHsKPiAgICAgICAgIENQVUhQX0FQX0lSUV9MT09OR0FSQ0hfU1RBUlRJTkcsCj4gICAgICAgICBD
UFVIUF9BUF9JUlFfU0lGSVZFX1BMSUNfU1RBUlRJTkcsCj4gICAgICAgICBDUFVIUF9BUF9JUlFf
UklTQ1ZfSU1TSUNfU1RBUlRJTkcsCj4gKyAgICAgICBDUFVIUF9BUF9JUlFfUklTQ1ZfU1dJTlRf
U1RBUlRJTkcsCgpUaGlzIGlzIGEgbWlzbGVhZGluZyBuYW1lLgoKSSBzdWdnZXN0IHMvX1JJU0NW
X1NXSU5UXy9fUklTQ1ZfU0JJX0lQSV8vIC4KCj4gICAgICAgICBDUFVIUF9BUF9BUk1fTVZFQlVf
Q09IRVJFTkNZLAo+ICAgICAgICAgQ1BVSFBfQVBfUEVSRl9YODZfQU1EX1VOQ09SRV9TVEFSVElO
RywKPiAgICAgICAgIENQVUhQX0FQX1BFUkZfWDg2X1NUQVJUSU5HLAo+IC0tCj4gMi4zNC4xCj4K
ClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
