Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA2AC25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZfefK2/Xs7DdkFHUrCsIv6jCy+Fhk3/WtgW0LXN6/k=; b=igx39lg1BJc4S6
	FxREWs46IpeiQJOnvyScuWv3ZKHGtX+fOEafq26dNjPmwHubk/w6RHsZbcrq/Me706FIouQVuFG77
	vbnafPL+ESnDkcOpSQps/7ey6jrf3eKSq6dyRfqza9lcZ266cbmBCs3t6k+HkP69aROvC8RjoEP6K
	6TUw8FcF1RKM9ze9LeCSILTThvDCf3GEAgxTZNzdlPDo4D1YidRDIqp/z7O7az2Fmq8pu/yqptY6w
	VW2kUq6Rxqg3J6NidE1O6piX+VObSrf7dfo/GMC3WUjcEPhu4TvSI2n9MPigopH0CmguTEeo7avQJ
	r2ilTUwTXFbk7ElvVLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCbO-00000002yUB-3BxY;
	Wed, 29 May 2024 06:15:58 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCbL-00000002yTT-1MQE
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 06:15:56 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e95a1d5ee2so30903981fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 23:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716963352; x=1717568152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh0ieLiOPTlnWO1kYS9M0GlqV4zOVJ6IiYKninn4+tc=;
        b=y9+OI+bz+Od1pVQFH7ZLI4dOnN1axIVrhFE1gTny18MuHV5cXPnO5gRwBQbFoxkVNG
         32hyvJtElO0BEAz0BOhMWP8ML2C9Xq5qEjT9+rPCtowB4mQ7y/hwH4OqDjiDOEQ32peu
         HLgSIUlRwzogvkugemDFqPj+WPwZ+0nZVm1vn+25ltB5cDNNMHNuvzmKWd9UDr6AIL5I
         da/XD47b2uqQmNq442nQykz8PKfTmQw+c67Vu7YNiCf7vhwaaGuv0uhhfDpu7YjIFTfb
         BdWFi3EuFxo3/YxiY6lME8VH8Fcw4zK0agHPiHej5OEYDPymQw5Owtwi04SjUrc/Ju5G
         koNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716963352; x=1717568152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh0ieLiOPTlnWO1kYS9M0GlqV4zOVJ6IiYKninn4+tc=;
        b=SSNPc6daSWUpvNuiERx9t31KRHpSNU2PvtXAHxeBIf3vlDxg/m4htB0EJ2LsYs05aG
         kx3vfFm7U/XFBLizztxZDilYFGxuQqMsZF+lj5wFiLZmD7YerF1e0mETO1ckbZ7F97AV
         WpHEdHsIbSnYb5uZN/p2DRODu3uTk/XqrAu7aQDrioewbEeZHjxhNiDdy3v80rEEHhO+
         AZS6YZjqiW7feg7KcKreCuo+0YFExKjYuePsoHjkQoLcvwIBv3RDZWFPFoSWVi48byFM
         PXKMZ+HCsrLQOix9+HpBZuMO7t5QiPI294osWnSByqTJhsZN7ClQrSEovFq/WFBSAFkZ
         nHug==
X-Forwarded-Encrypted: i=1; AJvYcCXX/BYeEvmV8KWLITuRRxzmlSWQ2+B0Ox8HkAZ+UauPephtWvCmcalSebRp0Q9B+SXLk3ug/1Y5Lg6Lu2l7Ad5h+zCuivNSxUmlsgug0DkQ
X-Gm-Message-State: AOJu0Yy36PjGzsHKU/CxZtIN3NiNQd28c55Hmx/HqskdV37MeYhI+gJZ
	fi93hMLGU5R5efxNegnqGffMc/89rRzy6LqAGdVL01T+s481fabslwzcCYXNVcL93WVRrZqS7BN
	6EuNdPTVbCZHB1Lq3bUSCYr+hcJAyjxCCZjPmbQ==
X-Google-Smtp-Source: AGHT+IEm6bYc2ftZFt2uXoqzzY7bu2Oy5wbaxhF7xACheYlMcKXX+Saw39KXwd1j/qas7p5N+0C1MMzLyv9RtXFbmuc=
X-Received: by 2002:a2e:968a:0:b0:2e1:c448:d61e with SMTP id
 38308e7fff4ca-2e95b096f52mr108173371fa.15.1716963352171; Tue, 28 May 2024
 23:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-5-alexghiti@rivosinc.com> <20240528-prenatal-grating-2b6096cc2a1b@spud>
In-Reply-To: <20240528-prenatal-grating-2b6096cc2a1b@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 08:15:40 +0200
Message-ID: <CAHVXubhsqOp2hSxVg7eGjjLN2-iTUFz1AMDTeEvyJh01iypzrw@mail.gmail.com>
Subject: Re: [PATCH 4/7] riscv: Implement xchg8/16() using Zabha
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_231555_517048_7FD7C8DC 
X-CRM114-Status: GOOD (  12.82  )
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

SGkgQ29ub3IsCgpPbiBUdWUsIE1heSAyOCwgMjAyNCBhdCA1OjIy4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDI0IGF0IDA1
OjEwOjQ5UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiAgICAgICAgIFwKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IGluZGV4IGUxN2QwMDc4YTY1MS4uZjcxZGRkMmNhMTYzIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IEBAIC04MSw2ICs4MSw3IEBACj4gPiAg
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pUU08gICAgICAgICAgIDcyCj4gPiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pBQ0FTICAgICAgICAgIDczCj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hB
TkRFU1BNVSAgICAgICAgICAgICAgNzQKPiA+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFCSEEg
ICAgICAgICAgNzUKPiA+Cj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRyAg
IDEyNwo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGluZGV4IDNlZDIzNTllYWUzNS4u
OGQwZjU2ZGQyZjUzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IEBAIC0yNTcs
NiArMjU3LDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0
W10gPSB7Cj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhpbnRwYXVzZSwgUklTQ1Zf
SVNBX0VYVF9aSUhJTlRQQVVTRSksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhw
bSwgUklTQ1ZfSVNBX0VYVF9aSUhQTSksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6
YWNhcywgUklTQ1ZfSVNBX0VYVF9aQUNBUyksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFU
QSh6YWJoYSwgUklTQ1ZfSVNBX0VYVF9aQUJIQSksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRf
REFUQSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZBKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RB
VEEoemZobWluLCBSSVNDVl9JU0FfRVhUX1pGSE1JTiksCj4KPiBZb3UncmUgbWlzc2luZyBhIGR0
LWJpbmRpbmcgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgYWRkaW5nIHphYmhhLgoKVGhhbmtzLCBJIHdp
bGwgYWRkIHRoYXQgdG8gdGhlIHYyLgoKPgo+IFRoYW5rcywKPiBDb25vci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
