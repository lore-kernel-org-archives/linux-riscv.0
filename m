Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EBCC83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dL3wovwvIBLjEaupIJ9KZXp3YLoADP2gLVHjZAuH+/E=; b=FgepXGxReRgv3C
	rcnU2XZxKb2Yc9bjM+Jg2ANdx+WLWQ5moTMXiZ4qYKJGQ7kzl8LKtJ/YhOImH5oQGAiKl0SARqFzP
	GpE6dsEfShzELdata+4/8D9zvScFb7yvYxtl3hGSL7+t2qZsfZnKjKE2687LpBamGCorel6ur7ofG
	ogm3twPpuJp4m+RTyPjG7MAe+dPF435nDKy4ofpbvATfWd0BWgwX5PXwoYKVmB+Oo8N53aAR5YP1Q
	BBvL9eB0dnfvUe5a/FTby6anbK7uvtPOy/uGd2ppvEzLutdR0lWb+xJeb1qU7mcAZfnKca1ff57Yb
	ZChfgLbq3rkXKN9eQ4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZs9x-0000000C65y-1u4Z;
	Thu, 10 Jul 2025 14:22:01 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqUm-0000000Bn1U-39gs
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 12:35:26 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae360b6249fso151763866b.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752150922; x=1752755722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYqkWjUbgDgAMhDOaLlsy2feUWXhugPze0zXdTjzjHk=;
        b=SjoindNnz0u3POF2if0H+/3d8DnHCXmK2rrmbJU77oEPixlduiLikMzXsdDIMuh+Iz
         msW+uVfW1Y6tFgGTXuRsbReftCaxRX0wNdwvPmUAZ8eNYdjOQOP0eO/mEOXbU6lUDbtJ
         PlrE5clXFVpajsm6sdWeLxhu0O8C0qJ1GJvotmgyyBu7ZAc9gAkKgSPPQx9xVfdIEac0
         FItYEdc/NFH/pPGN00BbQddaSgFKNCQdL/QBw/yV6bQ3AVry4CTzJ0nUPnT8x5NnrLUT
         ZAGyae8Vq+Y+i8li3Q7G7wJ1J7NQIwZX7v2+oVbdf6igp77/4KQXcRKFRaJqVFyJ22M6
         ivbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150922; x=1752755722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYqkWjUbgDgAMhDOaLlsy2feUWXhugPze0zXdTjzjHk=;
        b=KH7QZ4RSoVOImJd7cXxWwVQjD4zjIkUEwgGlIHiJBj+XYdAL9au3XnwiK6/T4hqD5H
         yO/MelnkmYG4AosdRx/MAheK6rwDTS/SyiobeWsnRUAvXv+UPXUXXnz1OPb+DC09q5Pg
         7/lcBfeRnSX91faifpu/S92pT+zNdouQKYq3DIcgCBo3MipM0lbr+/VP43oxo3lzFX5Y
         AMKsgZ7qquZrNpEfDeR0VCspsLHEUpMrQoxxfyB+EM9CpZuex071yqNbZ4evOTzKL+bI
         5sp8GgdBjPapN+cRJTA8+L91H+zTNUeJX3vlzIAXmHM9xgfthfLPO7FvhGwxUIZjtgyC
         Uc6g==
X-Forwarded-Encrypted: i=1; AJvYcCUzwVDj1K/To1rtgWjMJ9yvXEgk7qsc2xh6sGY2FyChO49Jsr8Y5t73N09H94424qqMdr+sCm55cyFDwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwetMyIzEiNPA7Q5oTHhId0p/VXtGNgbPRpAg77E9UFJL1DGqMr
	yBUHamgnZuNZUeOf/niakAiNCJczk1JY9dbdLnWPCShJM6zrKMas5ag0c7YiS3JgEJchL6p5cbh
	d9qryEKlJj/l4quD5WRHa+D6JVJ7wM/0=
X-Gm-Gg: ASbGnctgriu6H0prPqCrVtL0zZILCUZwt6lFRiebdrCiCh/UxAd7o4+txKGv7+Ce50i
	CnalmNB6awgmweTQy4CF3bFYYCsZlTlp93pvzFE40TO1ipybHNQ2PgMZ8AJrPbIQrEAApty7avT
	a466Cwm33s8Fg2NHjGrnMhEiYEM0QZpdef3rc61wGeLaU=
X-Google-Smtp-Source: AGHT+IHX3T7PV+QykAyNuRR2dadti9v2Ie7wRir36J2u9mQCz2nSMY967MJ2BBYwJz7saaIfCMnr2xs/Ohboe+eEpZM=
X-Received: by 2002:a17:906:6d96:b0:ae3:6cc8:e431 with SMTP id
 a640c23a62f3a-ae6cfbb7884mr544526266b.57.1752150922268; Thu, 10 Jul 2025
 05:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <aG3A8Jirg+TxNza/@rli9-mobl> <f5b1fc77-d180-4df7-b8f6-0cb0ca4a187a@ghiti.fr>
In-Reply-To: <f5b1fc77-d180-4df7-b8f6-0cb0ca4a187a@ghiti.fr>
From: Miao Chen <chenmiao.ku@gmail.com>
Date: Thu, 10 Jul 2025 20:34:45 +0800
X-Gm-Features: Ac12FXz3YDmx_bCl1jwLRzCqzWV1jsBoaUE9F5V_xEYIQNA0e0JwLEYjqB_I24M
Message-ID: <CAKxVwge4=cagaVDesKWe0BE88U0YmNn5LLDJvJG=F7EEP2=-LQ@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: kernel test robot <lkp@intel.com>, Linux RISCV <linux-riscv@lists.infradead.org>, 
	oe-kbuild-all@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Pu Lehui <pulehui@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_053524_790644_EB4A1ABA 
X-CRM114-Status: GOOD (  16.93  )
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

SGVsbG8gQWxleCwKClN1cmUsIEknbGwgY2hlY2tvdXQgaXQuIEJ0dywgdGhpcyBpcyBteSBmaXJz
dCBjb21taXQsIHNvIGNhbiB1IHRlbGwKaG93IHRvIHJlcHJvZHVjZSBmYWlsZWQgY2FzZT8gVXNp
bmcgdGhlIHJlcHJvZHVjZSBhbmQgLmNvbmZpZy5neiBnaXZlZApieSBidWlsZC1ib3Q/CgpUaGFu
a3MsCgpDaGVuIE1pYW8KCkFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4g5LqOMjAyNeW5
tDfmnIgxMOaXpeWRqOWbmyAxOTo1M+WGmemBk++8mgo+Cj4gSGkgQ2hlbk1pYW8sCj4KPiBPbiA3
LzkvMjUgMDM6MDgsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOgo+ID4gSGkgQ2hlbk1pYW8sCj4g
Pgo+ID4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9y
czoKPiA+Cj4gPiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIGZkYTU4OWMyODYwNDBkOWJhMmQ3
MmEwZWFmMGExMzk0NWZjNDgwMjZdCj4gPgo+ID4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0NoZW5NaWFvL3Jpc2N2LWZ0cmFjZS1GaXgtdGhl
LWxvZ2ljLWlzc3VlLWluLURZTkFNSUNfRlRSQUNFLXNlbGVjdGlvbi8yMDI1MDcwNi0yMzE5MDcK
PiA+IGJhc2U6ICAgZmRhNTg5YzI4NjA0MGQ5YmEyZDcyYTBlYWYwYTEzOTQ1ZmM0ODAyNgo+ID4g
cGF0Y2ggbGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDcwNjE1MTgzMC4y
NTA5MS0xLWNoZW5taWFvLmt1JTQwZ21haWwuY29tCj4gPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0gg
VjJdIHJpc2N2OiBmdHJhY2U6IEZpeCB0aGUgbG9naWMgaXNzdWUgaW4gRFlOQU1JQ19GVFJBQ0Ug
c2VsZWN0aW9uCj4gPiA6Ojo6OjogYnJhbmNoIGRhdGU6IDIgZGF5cyBhZ28KPiA+IDo6Ojo6OiBj
b21taXQgZGF0ZTogMiBkYXlzIGFnbwo+ID4gY29uZmlnOiByaXNjdi1yYW5kY29uZmlnLXIxMTIt
MjAyNTA3MDggKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gPiBjb21waWxlcjogY2xhbmcgdmVyc2lv
biAxOS4xLjcgKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdCBjZDcwODAyOWUw
YjI4NjllODBhYmUzMWRkYjE3NWY3YzM1MzYxZjkwKQo+ID4gcmVwcm9kdWNlOiAoYXR0YWNoZWQg
YXMgcmVwcm9kdWNlKQo+ID4KPiA+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUg
cGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiA+IHRoZSBzYW1l
IHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKPiA+IHwgUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gfCBDbG9zZXM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTA3MDkwNjUwLllHWTU2U0lBLWxr
cEBpbnRlbC5jb20vCj4gPgo+ID4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4p
Ogo+ID4KPiA+Pj4gPGluc3RhbnRpYXRpb24+OjE6MTQ6IGVycm9yOiBvcGVyYW5kIG11c3QgYmUg
YSBzeW1ib2wgd2l0aCAlbG8vJXBjcmVsX2xvLyV0cHJlbF9sbyBtb2RpZmllciBvciBhbiBpbnRl
Z2VyIGluIHRoZSByYW5nZSBbLTIwNDgsIDIwNDddCj4gPiAgICAgYWRkaSBzcCwgc3AsIC1GUkVH
U19TSVpFX09OX1NUQUNLCj4gPiAgICAgICAgICAgICAgICAgIF4KPiA+ICAgICBhcmNoL3Jpc2N2
L2tlcm5lbC9tY291bnQtZHluLlM6MTg1OjI6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRp
YXRpb24KPiA+ICAgICAgU0FWRV9BQklfUkVHUwo+ID4gICAgICBeCj4gPj4+IDxpbnN0YW50aWF0
aW9uPjoyOjE4OiBlcnJvcjogdW5leHBlY3RlZCB0b2tlbgo+ID4gICAgICBzdyB0MCwgRlJFR1Nf
RVBDKHNwKQo+ID4gICAgICAgICAgICAgICAgICAgICAgXgo+ID4gICAgIGFyY2gvcmlzY3Yva2Vy
bmVsL21jb3VudC1keW4uUzoxODU6Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlhdGlv
bgo+ID4gICAgICBTQVZFX0FCSV9SRUdTCj4gPiAgICAgIF4KPiA+ICAgICA8aW5zdGFudGlhdGlv
bj46MzoxNzogZXJyb3I6IHVuZXhwZWN0ZWQgdG9rZW4KPiA+ICAgICAgc3cgeDEsIEZSRUdTX1JB
KHNwKQo+ID4gICAgICAgICAgICAgICAgICAgICBeCj4gPiAgICAgYXJjaC9yaXNjdi9rZXJuZWwv
bWNvdW50LWR5bi5TOjE4NToyOiBub3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCj4g
PiAgICAgIFNBVkVfQUJJX1JFR1MKPiA+ICAgICAgXgo+ID4gICAgIDxpbnN0YW50aWF0aW9uPjo3
OjE3OiBlcnJvcjogdW5leHBlY3RlZCB0b2tlbgo+ID4gICAgICBzdyB4NiwgRlJFR1NfVDEoc3Ap
Cj4gPiAgICAgICAgICAgICAgICAgICAgIF4KPiA+ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291
bnQtZHluLlM6MTg1OjI6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KPiA+ICAg
ICAgU0FWRV9BQklfUkVHUwo+ID4gICAgICBeCj4gPiAgICAgPGluc3RhbnRpYXRpb24+Ojk6MTc6
IGVycm9yOiB1bmV4cGVjdGVkIHRva2VuCj4gPiAgICAgIHN3IHg3LCBGUkVHU19UMihzcCkKPiA+
ICAgICAgICAgICAgICAgICAgICAgXgo+ID4gICAgIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1k
eW4uUzoxODU6Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlhdGlvbgo+ID4gICAgICBT
QVZFX0FCSV9SRUdTCj4gPiAgICAgIF4KPiA+ICAgICA8aW5zdGFudGlhdGlvbj46MTA6MTg6IGVy
cm9yOiB1bmV4cGVjdGVkIHRva2VuCj4gPiAgICAgIHN3IHgyOCwgRlJFR1NfVDMoc3ApCj4gPiAg
ICAgICAgICAgICAgICAgICAgICBeCj4gPiAgICAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5
bi5TOjE4NToyOiBub3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCj4gPiAgICAgIFNB
VkVfQUJJX1JFR1MKPiA+ICAgICAgXgo+ID4gICAgIDxpbnN0YW50aWF0aW9uPjoxMToxODogZXJy
b3I6IHVuZXhwZWN0ZWQgdG9rZW4KPiA+ICAgICAgc3cgeDI5LCBGUkVHU19UNChzcCkKPiA+ICAg
ICAgICAgICAgICAgICAgICAgIF4KPiA+ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHlu
LlM6MTg1OjI6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KPiA+ICAgICAgU0FW
RV9BQklfUkVHUwo+ID4gICAgICBeCj4gPiAgICAgPGluc3RhbnRpYXRpb24+OjEyOjE4OiBlcnJv
cjogdW5leHBlY3RlZCB0b2tlbgo+ID4gICAgICBzdyB4MzAsIEZSRUdTX1Q1KHNwKQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgXgo+ID4gICAgIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4u
UzoxODU6Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlhdGlvbgo+ID4gICAgICBTQVZF
X0FCSV9SRUdTCj4gPiAgICAgIF4KPiA+ICAgICA8aW5zdGFudGlhdGlvbj46MTM6MTg6IGVycm9y
OiB1bmV4cGVjdGVkIHRva2VuCj4gPiAgICAgIHN3IHgzMSwgRlJFR1NfVDYoc3ApCj4gPiAgICAg
ICAgICAgICAgICAgICAgICBeCj4gPiAgICAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5T
OjE4NToyOiBub3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCj4gPiAgICAgIFNBVkVf
QUJJX1JFR1MKPiA+ICAgICAgXgo+ID4gICAgIDxpbnN0YW50aWF0aW9uPjoxNjoxODogZXJyb3I6
IHVuZXhwZWN0ZWQgdG9rZW4KPiA+ICAgICAgc3cgeDEwLCBGUkVHU19BMChzcCkKPiA+ICAgICAg
ICAgICAgICAgICAgICAgIF4KPiA+ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlM6
MTg1OjI6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KPiA+ICAgICAgU0FWRV9B
QklfUkVHUwo+ID4gICAgICBeCj4gPiAgICAgPGluc3RhbnRpYXRpb24+OjE3OjE4OiBlcnJvcjog
dW5leHBlY3RlZCB0b2tlbgo+ID4gICAgICBzdyB4MTEsIEZSRUdTX0ExKHNwKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgXgo+ID4gICAgIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUzox
ODU6Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlhdGlvbgo+ID4gICAgICBTQVZFX0FC
SV9SRUdTCj4gPiAgICAgIF4KPiA+ICAgICA8aW5zdGFudGlhdGlvbj46MTg6MTg6IGVycm9yOiB1
bmV4cGVjdGVkIHRva2VuCj4gPiAgICAgIHN3IHgxMiwgRlJFR1NfQTIoc3ApCj4gPiAgICAgICAg
ICAgICAgICAgICAgICBeCj4gPiAgICAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TOjE4
NToyOiBub3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCj4gPiAgICAgIFNBVkVfQUJJ
X1JFR1MKPiA+ICAgICAgXgo+ID4gICAgIDxpbnN0YW50aWF0aW9uPjoxOToxODogZXJyb3I6IHVu
ZXhwZWN0ZWQgdG9rZW4KPiA+ICAgICAgc3cgeDEzLCBGUkVHU19BMyhzcCkKPiA+ICAgICAgICAg
ICAgICAgICAgICAgIF4KPiA+ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlM6MTg1
OjI6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KPiA+ICAgICAgU0FWRV9BQklf
UkVHUwo+ID4gICAgICBeCj4gPiAgICAgPGluc3RhbnRpYXRpb24+OjIwOjE4OiBlcnJvcjogdW5l
eHBlY3RlZCB0b2tlbgo+ID4gICAgICBzdyB4MTQsIEZSRUdTX0E0KHNwKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgXgo+ID4gICAgIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUzoxODU6
Mjogbm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlhdGlvbgo+ID4gICAgICBTQVZFX0FCSV9S
RUdTCj4gPiAgICAgIF4KPiA+ICAgICA8aW5zdGFudGlhdGlvbj46MjE6MTg6IGVycm9yOiB1bmV4
cGVjdGVkIHRva2VuCj4gPiAgICAgIHN3IHgxNSwgRlJFR1NfQTUoc3ApCj4gPiAgICAgICAgICAg
ICAgICAgICAgICBeCj4gPiAgICAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TOjE4NToy
OiBub3RlOiB3aGlsZSBpbiBtYWNybyBpbnN0YW50aWF0aW9uCj4gPiAgICAgIFNBVkVfQUJJX1JF
R1MKPiA+ICAgICAgXgo+ID4gICAgIDxpbnN0YW50aWF0aW9uPjoyMjoxODogZXJyb3I6IHVuZXhw
ZWN0ZWQgdG9rZW4KPiA+ICAgICAgc3cgeDE2LCBGUkVHU19BNihzcCkKPiA+ICAgICAgICAgICAg
ICAgICAgICAgIF4KPiA+ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlM6MTg1OjI6
IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KPiA+ICAgICAgU0FWRV9BQklfUkVH
Uwo+ID4gICAgICBeCj4gPiAgICAgPGluc3RhbnRpYXRpb24+OjIzOjE4OiBlcnJvcjogdW5leHBl
Y3RlZCB0b2tlbgo+ID4gICAgICBzdyB4MTcsIEZSRUdTX0E3KHNwKQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgXgo+ID4gICAgIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUzoxODU6Mjog
bm90ZTogd2hpbGUgaW4gbWFjcm8gaW5zdGFudGlhdGlvbgo+ID4gICAgICBTQVZFX0FCSV9SRUdT
Cj4gPiAgICAgIF4KPiA+ICAgICA8aW5zdGFudGlhdGlvbj46MjU6MTU6IGVycm9yOiBvcGVyYW5k
IG11c3QgYmUgYSBzeW1ib2wgd2l0aCAlbG8vJXBjcmVsX2xvLyV0cHJlbF9sbyBtb2RpZmllciBv
ciBhbiBpbnRlZ2VyIGluIHRoZSByYW5nZSBbLTIwNDgsIDIwNDddCj4gPiAgICAgIGFkZGkgYTAs
IGEwLCBGUkVHU19TSVpFX09OX1NUQUNLCj4gPiAgICAgICAgICAgICAgICAgICBeCj4gPiAgICAg
YXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TOjE4NToyOiBub3RlOiB3aGlsZSBpbiBtYWNy
byBpbnN0YW50aWF0aW9uCj4gPiAgICAgIFNBVkVfQUJJX1JFR1MKPiA+Cj4gPiBLY29uZmlnIHdh
cm5pbmdzOiAoZm9yIHJlZmVyZW5jZSBvbmx5KQo+ID4gICAgIFdBUk5JTkc6IHVubWV0IGRpcmVj
dCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIERZTkFNSUNfRlRSQUNFCj4gPiAgICAgRGVwZW5k
cyBvbiBbbl06IEZUUkFDRSBbPXldICYmIEZVTkNUSU9OX1RSQUNFUiBbPXldICYmIEhBVkVfRFlO
QU1JQ19GVFJBQ0UgWz1uXQo+ID4gICAgIFNlbGVjdGVkIGJ5IFt5XToKPiA+ICAgICAtIFJJU0NW
IFs9eV0gJiYgRlVOQ1RJT05fVFJBQ0VSIFs9eV0KPgo+IFRvIGF2b2lkIHRoYXQsIHdlIHNob3Vs
ZCBjaGVjayBIQVZFX0RZTkFNSUNfRlRSQUNFIHRvbzoKPgo+IHNlbGVjdCBEWU5BTUlDX0ZUUkFD
RSBpZiBGVU5DVElPTl9UUkFDRVIgJiYgSEFWRV9EWU5BTUlDX0ZUUkFDRQo+Cj4gVGhhdCBmaXhl
cyB0aGUgYnVpbGQgZXJyb3IgZm9yIG1lLiBDYW4geW91IHNlbmQgYSB2MyB3aXRoIHRoaXMgY2hh
bmdlPwo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
