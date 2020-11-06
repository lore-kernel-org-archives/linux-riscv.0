Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE94CC388F7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:55:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D0A20782
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p5bQmwQs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngBOoevt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D0A20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t9DeAOV00Fnx/o9+lqQa5HOK7np4ZZInklPvqmI1IKI=; b=p5bQmwQsbM2VTCpjp+esl1qJ9
	bOTEfCACAikH6xVMiEBe0KZ6DZnJ7ir38g6ap+wbaAD2w1mZXl8Jaib4OkHe2539W4mQPRIumYbBD
	e8VHrN8I8KNZR7eA5k20+dkGb7SuPwiXBJorPfjqeF8kxvArWtHJDVENJWUlU060LEQL1bp/DuOVA
	Z9gon9ewpU83tVve9s5Cy3AOKfPNv9Wh/5l0WKRFOec8gxo8Dkh7MMU0kswH4pZZ/ACFtszVNVcUW
	geH4zdkUSfwzRW58CgQHXYm+ohV60grVvS1u5WKKL0f0HqhtbP4+si8ZyfbnLC/K1XTJyjPzibVfE
	iU8z+CnWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1karuE-0004Kx-W1; Fri, 06 Nov 2020 02:55:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1karuB-0004K1-QR
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 02:55:12 +0000
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 566532100A
 for <linux-riscv@lists.infradead.org>; Fri,  6 Nov 2020 02:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604631310;
 bh=GCRu5Nj6jlFu7EoC6UyDydSyAjZGCvEP1u13Yu2YJkU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ngBOoevtyMiaZoS5dLNMl5K6SHrIs+qW8jE+nVSG26e8PE1P2kMQhNldJVD/Nog8u
 RislWWMtlbuzn0I/jE9+/1QMnhK1mYjuv1BBuCWURKFjJJFkw7v5qaUVYs5u0nS3ZL
 ftVlSp2BZVAQlKp12wu4US0Z9DJWG89A4riVByoI=
Received: by mail-lj1-f177.google.com with SMTP id o13so3758729ljj.11
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 18:55:10 -0800 (PST)
X-Gm-Message-State: AOAM532kB6S5BIfIi+1InBY1eRlEo76n9PopPYByXO4PfNLiYGmWz9wR
 BIDQ5ve5ClGbPITNrfID3e3OtR1zZ+GbqzLbqu8=
X-Google-Smtp-Source: ABdhPJzfbFpuBLZhmEP5T24pYyEQWLJ9bVNG3rcuQ7VBcP+PYmdLj4SV5oT0cm306fdrgA6+20tTRV7rJ7SrePKYJRk=
X-Received: by 2002:a2e:8816:: with SMTP id x22mr1812466ljh.377.1604631308478; 
 Thu, 05 Nov 2020 18:55:08 -0800 (PST)
MIME-Version: 1.0
References: <1602918377-23573-2-git-send-email-guoren@kernel.org>
 <mhng-c3f5e2b4-0467-42f6-9f5b-e66ade70eef2@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-c3f5e2b4-0467-42f6-9f5b-e66ade70eef2@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Nov 2020 10:54:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRw57smCihUB7fWf32WgRwJBV86-xT6pxHstLSrCG119w@mail.gmail.com>
Message-ID: <CAJF2gTRw57smCihUB7fWf32WgRwJBV86-xT6pxHstLSrCG119w@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] RISC-V: Implement ptrace regs and stack API
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_215512_068837_5408ECB7 
X-CRM114-Status: GOOD (  18.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Alan Kao <alankao@andestech.com>,
 Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-csky@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA5OjAzIEFNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJi
ZWx0QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCAxNyBPY3QgMjAyMCAwMDowNjowOSBQ
RFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBQYXRyaWNrIFN0
w6RobGluIDxtZUBwYWNraS5jaD4KPiA+Cj4gPiBOZWVkZWQgZm9yIGtwcm9iZXMgc3VwcG9ydC4g
Q29waWVkIGFuZCBhZGFwdGVkIGZyb20gYXJtNjQgY29kZS4KPiA+Cj4gPiBHdW8gUmVuIGZpeHVw
IHB0X3JlZ3MgdHlwZSBmb3IgbGludXgtNS44LXJjMS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNrIFN0w6RobGluIDxtZUBwYWNraS5jaD4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4g
PGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBQZWtrYSBFbmJlcmcg
PHBlbmJlcmdAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNp
Zml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2Vy
bmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAg
MSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaCB8IDI5ICsrKysrKysrKysr
Kwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAgfCA5OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTI5IGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCBiNzgyMWFjLi5lNjQyNGQ4YiAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBA
QCAtODcsNiArODcsNyBAQCBjb25maWcgUklTQ1YKPiA+ICAgICAgIHNlbGVjdCBTUEFSU0VfSVJR
Cj4gPiAgICAgICBzZWxlY3QgU1lTQ1RMX0VYQ0VQVElPTl9UUkFDRQo+ID4gICAgICAgc2VsZWN0
IFRIUkVBRF9JTkZPX0lOX1RBU0sKPiA+ICsgICAgIHNlbGVjdCBIQVZFX1JFR1NfQU5EX1NUQUNL
X0FDQ0VTU19BUEkKPgo+IFdlIGFscGhhYmV0aXplIHRoZXNlIG5vdyAtLSBJJ2QgdXN1YWxseSBq
dXN0IGZpeCBpdCwgYnV0IHRoZXJlJ3MgYQo+IFNpZ25lZC1vZmYtYnkgaXNzdWUgbGF0ZXIgaW4g
dGhlIHBhdGNoIHNldC4Kb2ssIEknbGwgZml4IGl0IGFuZCByZWJhc2UgNS4xMC1yYzIuCgoKLS0g
CkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
