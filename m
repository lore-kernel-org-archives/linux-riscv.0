Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD4FC61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePY2/cpdoLCrlKzOMtb1AXLF228GggB6evT8xXV5MQ4=; b=cIHS7wV+owk+JG
	Olw9F8nmvC5yHcx460Z61GKEt9VXIuFcvDRU124V6usLbcbgCKgajBM6MGob6LRaiWAkLhsxcdEfS
	jXN0QWWTr8JdgD7y1+xtakCboQW1c4qJJNCeC9XzWjWMj5T6LyVOpsRrFDJsU+PnfNMij3DwLBpaS
	vNbFrXfEZR+Hkxan7kkXcKZPwsTaanIWhoIQN30bRZR6JkMPrH12L4nfmOhNLCpSGFLSxqvGkizmu
	kxKe7nUZKYIUuIgyJ0yn8r7T+tog4P/IjnyjIXfiEFzjoQenU+oJgJctAGKe1iFopGOp8prQ82hGs
	OWoN9QqoW7TXwBHGrjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ToO-006vC8-2n;
	Fri, 24 Nov 2023 10:53:29 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ToK-006v9v-1X
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 10:53:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-285636785ddso1216279a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Nov 2023 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700823199; x=1701427999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G13q4Npyv/Ly9t6e83+KIY+krKu4thVjMslYff6WcPI=;
        b=K6HZD9OyfeI5Pl5y0fr4we1OhLDHZj8XE0wHoe0K41tn7naLaPaBQJvLXpN9BL1wkp
         /6V5fs4oA6jOOdV2RkQauRV4yhi08hyP7UJjNXLSth6heUvkqNNP+VIDA1HiWqylX8aX
         EGhCA+gaKycneHrj2YXYafoIWWo0isL5PcRiXxQX9ILKs9WfniRZpGN6fyZHW99CrK+Z
         OPJFFfaXTACYAOMSAXjkf9Qhyl578HboyBWM5dPZvSfCG1hfDrJy0slPl4lyPjVwv12d
         KwTCqQK4w/xYbXegxQXNLLPNGC3qC3aIChsxuGcOY0upSVHF4+ps0BmvlaV8I2q/0vvN
         RUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700823199; x=1701427999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G13q4Npyv/Ly9t6e83+KIY+krKu4thVjMslYff6WcPI=;
        b=OhGocFWxn/Oma5Px6OxSACbYQ9oo9dPZCXxgLuLxpycpjUvOMiW/OgIdvkmaliwrbt
         +GY+t/5vR8Y/Y0Bq0thlBBsO8T0ascWXAisqR/Ll6e8wjIJSzYgK3EsQel06yKSsJ/n+
         Ttpm9V20EpDFXY7RSGzdDYll4dnqJ6UC53rvMy5OBTy3lmtnMVoBKv2hpYgqqFVA1RCw
         /OhRhu3iedxyP4EIU6LJSpWwWEJVSMUQSPb3LUmEqSm0VBv7+Nr6VHtRpQ9nBc78mcp/
         NvkkNXTosxbopjEwZgRC2u0wljZeSSSn6kmzlxRkI72VuTJaNH/Ouv0vuPoQCCQeQSq7
         U5Gw==
X-Gm-Message-State: AOJu0YwOje+fHxfMl2K6ZQLZAbCq2F6auopInTXsmBEp1bqUJ4ZFq34Q
	ULX4nQtNVkGx6iJ0kw/x04TqOfBos0MDYhAi28yjvQ==
X-Google-Smtp-Source: AGHT+IFIeQIFowpfBFOWrzbJuo6dqXpVySOYNiIwl+Kh/YJg26vm2tehxdWw4alf5s2od+tF6f8fxXN9ap5KOjqXBjQ=
X-Received: by 2002:a17:90b:4d0e:b0:280:62a7:3743 with SMTP id
 mw14-20020a17090b4d0e00b0028062a73743mr2278223pjb.30.1700823199176; Fri, 24
 Nov 2023 02:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu> <20231124101519.GP3818@noisy.programming.kicks-ass.net>
In-Reply-To: <20231124101519.GP3818@noisy.programming.kicks-ass.net>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 24 Nov 2023 11:53:06 +0100
Message-ID: <CAEg0e7j1AvzTyaQ45wUP9QnsMpCG=ZMzcLNFYhGPPSgAwsty6A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <apatel@ventanamicro.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, 
	Guo Ren <guoren@kernel.org>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_025325_716506_4A987A95 
X-CRM114-Status: GOOD (  23.70  )
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

T24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMTE6MTXigK9BTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMDg6MjE6
MzdBTSArMDEwMCwgQ2hyaXN0b3BoIE11ZWxsbmVyIHdyb3RlOgo+ID4gRnJvbTogQ2hyaXN0b3Bo
IE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cj4gPgo+ID4gVGhlIHVwY29t
aW5nIFJJU0MtViBTc2R0c28gc3BlY2lmaWNhdGlvbiBpbnRyb2R1Y2VzIGEgYml0IGluIHRoZSBz
ZW52Y2ZnCj4gPiBDU1IgdG8gc3dpdGNoIHRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwgYXQg
cnVuLXRpbWUgZnJvbSBSVldNTyB0byBUU08KPiA+IChhbmQgYmFjaykuIFRoZSBhY3RpdmUgY29u
c2lzdGVuY3kgbW9kZWwgY2FuIHRoZXJlZm9yZSBiZSBzd2l0Y2hlZCBvbiBhCj4gPiBwZXItaGFy
dCBiYXNlIGFuZCBtYW5hZ2VkIGJ5IHRoZSBrZXJuZWwgb24gYSBwZXItcHJvY2Vzcy90aHJlYWQg
YmFzZS4KPgo+IFlvdSBndXlzLCBjb21wdXRlcnMgYXJlIGhhcnRsZXNzLCBub2JvZHkgdG9sZCB5
YT8KClRoYXQncyB3aHkgdGhleSBjYW1lIHVwIHdpdGggUklTQy1WLCB0aGUgSVNBIHdpdGggaGFy
dCEKCj4gPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgYmFzaWMgU3NkdHNvIHN1cHBvcnQgYW5kIGFk
ZHMgYSBwcmN0bCBBUEkgb24gdG9wCj4gPiBzbyB0aGF0IHVzZXItc3BhY2UgcHJvY2Vzc2VzIGNh
biBzd2l0Y2ggdG8gYSBzdHJvbmdlciBtZW1vcnkgY29uc2lzdGVuY3kKPiA+IG1vZGVsICh0aGFu
IHRoZSBrZXJuZWwgd2FzIHdyaXR0ZW4gZm9yKSBhdCBydW4tdGltZS4KPiA+Cj4gPiBJIGFtIG5v
dCBzdXJlIGlmIG90aGVyIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBzd2l0Y2hpbmcgdGhlIG1lbW9y
eQo+ID4gY29uc2lzdGVuY3kgbW9kZWwgYXQgcnVuLXRpbWUsIGJ1dCBkZXNpZ25pbmcgdGhlIHBy
Y3RsIEFQSSBpbiBhbgo+ID4gYXJjaC1pbmRlcGVuZGVudCB3YXkgYWxsb3dzIHJldXNpbmcgaXQg
aW4gdGhlIGZ1dHVyZS4KPgo+IElJUkMgc29tZSBTcGFyYyBjaGlwcyBjb3VsZCBkbyB0aGlzLCBi
dXQgSSBkb24ndCB0aGluayBhbnlib2R5IGV2ZXIKPiBleHBvc2VkIHRoaXMgdG8gdXNlcnNwYWNl
IChvciB1c2VkIGl0IG11Y2gpLgo+Cj4gSUE2NCBoYWQgcGxhbm5lZCB0byBkbyB0aGlzLCBleGNl
cHQgdGhleSBtZXNzZWQgaXQgdXAgYW5kIGRpZCBpdCB0aGUKPiB3cm9uZyB3YXkgYXJvdW5kIChz
dHJvbmcgZmlyc3QgYW5kIHRoZW4gcmVsYXggaXQgbGF0ZXIpLCB3aGljaCBsZWFkIHRvCj4gdGhl
IGRpc2NvdmVyeSB0aGF0IGFsbCBleGlzdGluZyBzb2Z0d2FyZSBicm9rZSAoZCd1aCkuCj4KPiBJ
IHRoaW5rIEFSTTY0IGFwcHJvYWNoZWQgdGhpcyBwcm9ibGVtIGJ5IGFkZGluZyB0aGUKPiBsb2Fk
LWFjcXVpcmUvc3RvcmUtcmVsZWFzZSBpbnN0cnVjdGlvbnMgYW5kIGZvciBUU08gYmFzZWQgY29k
ZSwKPiB0cmFuc2xhdGUgaW50byB0aG9zZSAoZWcuIHg4NiAtPiBhcm02NCB0cmFuc3BpbGVycyku
Cj4KPiBJSVJDIFJpc2MtViBhY3R1YWxseSBoYXMgc3VjaCBpbnN0cnVjdGlvbnMgYXMgd2VsbCwg
c28gKndoeSogYXJlIHlvdQo+IGRvaW5nIHRoaXM/IT8hCgpOb3QgbmVlZGluZyBhIHRyYW5zcGls
ZXIgaXMgYWxyZWFkeSBhIGJlbmVmaXQuCkFuZCB0aGUgRFRTTyBhcHByb2FjaCBhbHNvIGNvdmVy
cyB0aGUgY2FzZXMgd2hlcmUgdHJhbnNwaWxlcnMgY2FuJ3QgYmUgdXNlZAooZS5nLiBiaW5hcnkt
b25seSBleGVjdXRhYmxlcyBvciBsaWJyYXJpZXMpLgoKV2UgYXJlIGFsc28gd29ya2luZyBvbiBl
eHRlbmRpbmcgbGQuc28gc3VjaCwgdGhhdCBpdCBzd2l0Y2hlcyB0byBEVFNPCihpZiBhdmFpbGFi
bGUpIGluIGNhc2UgdGhlIHVzZXIgd2FudHMgdG8gc3RhcnQgYW4gZXhlY3V0YWJsZSB0aGF0IHdh
cwpjb21waWxlZCBmb3IgWnRzbyBvciBsb2FkcyBhIGxpYnJhcnkgdGhhdCB3YXMgY29tcGlsZWQg
Zm9yIFp0c28uClRoaXMgd291bGQgdXRpbGl6ZSB0aGUgQVBJIHRoYXQgaXMgaW50cm9kdWNlZCBp
biB0aGlzIHBhdGNoc2V0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
