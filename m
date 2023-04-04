Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E879C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mt7owAm5eE15zfK4ceQRmzeI16EEUN/KXFSI85Qxrxk=; b=DfELROx/BBdH6q
	/x6HUPrQWxTpIfXzSBrmt1sUoYm9hIFRGTH3ZW+Bl+wrJgaQbJRNCyMYkIQNrp+58r9b6cOZVP1Sr
	Mq0N531GGsoRiuP2uE3n/j3BzsgXharFjmkYFHgDhtpgHJLjuvRL0u90S3A0AhY2TvYKjL4ym7j2j
	RVH5kYleR2M4xRA861IgUWYXcGORN2K8C7T1HsV7h/1gIbZ7vt8AlTCBEJ88e/l0H5i/490VjnO2N
	rwS51HUUk3ozj/k7OMLQbnENLaI3LD8ETF/NS2+2JcCZC7Xw+s/eGuel1JN4tz8N6L/0eWlEQoJkt
	Z4t4aJ8ovrGsf7COxhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjiFO-001vxi-1X;
	Tue, 04 Apr 2023 15:06:58 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjiFG-001vxM-2n
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:06:52 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-545e907790fso503507627b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwzDPt+9Axnp6bNzN+6EpAA+HQRFVNX7yH6ulz2lZ88=;
        b=cD7RoV/KHYA4hWT26+J8ErEZWqzAHt9eagDvlD1OD7uoO8Wn60F3y06j7lXKX94ElI
         JMWquZ1tP0+J2IMfMuoyOQDiy6ABCctcMYi5TybMGuI/JMZwXcRmJwrGS2vupxJgB42c
         gbLSIqQhIF/1WaZALUXo2Nsl0Axy7OHlfBxqWWMdELMi4mnkGJcrL8ugPBW2OpSVrfoM
         Ot+mJAUdarMn/HWLAsaODSdWZzPxh3MGjnVo0hnpMerDaFsMl+zqkwHRMMJfWrjWLboG
         f9FWRzZQERpQOByF62VJ10Pab9ytzidPu6AQUBb6ZxVb2uZpxYHpc5zvT7fx3eoH+hH8
         h+tA==
X-Gm-Message-State: AAQBX9f4wS1EITi2FuIJ9LlBkOSIsOAbpcXLiU2RaDNCVcJTRoBavWqg
	Zi621cuBUWEbpnYgAxrg45wrENvbWGhYBhzR
X-Google-Smtp-Source: AKy350bBUTq/9CzsZjKnpo+0vIqWzdKgeHw7Gi27aCbulOhjLz5kI2b3qqsT1laTeMVp+L5jhnql9g==
X-Received: by 2002:a81:4ed7:0:b0:541:7543:9be4 with SMTP id c206-20020a814ed7000000b0054175439be4mr3136555ywb.34.1680620808933;
        Tue, 04 Apr 2023 08:06:48 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 198-20020a8119cf000000b00545a08184d5sm3266581ywz.101.2023.04.04.08.06.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 08:06:48 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54601d90118so463753547b3.12
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:06:48 -0700 (PDT)
X-Received: by 2002:a81:440f:0:b0:545:5e70:323f with SMTP id
 r15-20020a81440f000000b005455e70323fmr1593040ywa.4.1680620806640; Tue, 04 Apr
 2023 08:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230403065207.1070974-1-bjorn@kernel.org>
In-Reply-To: <20230403065207.1070974-1-bjorn@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 17:06:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+sqGB5V4LZAcHw_4n6=ZVPs_v0uB9V-sPTUL1EpL6eg@mail.gmail.com>
Message-ID: <CAMuHMdV+sqGB5V4LZAcHw_4n6=ZVPs_v0uB9V-sPTUL1EpL6eg@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: Save a0 prior syscall_enter_from_user_mode()
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Conor Dooley <conor@kernel.org>, Yipeng Zou <zouyipeng@huawei.com>, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_080650_906243_594F62FE 
X-CRM114-Status: GOOD (  16.97  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCA4OjU04oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+Cj4gVGhlIFJJU0MtViBjYWxsaW5nIGNvbnZlbnRpb24gcGFzc2VzIHRoZSBmaXJzdCBhcmd1
bWVudCwgYW5kIHRoZQo+IHJldHVybiB2YWx1ZSBpbiB0aGUgYTAgcmVnaXN0ZXIuIEZvciB0aGlz
IHJlYXNvbiwgdGhlIGEwIHJlZ2lzdGVyCj4gbmVlZHMgc29tZSBleHRyYSBjYXJlOyBXaGVuIGhh
bmRsaW5nIHN5c2NhbGxzLCB0aGUgYTAgcmVnaXN0ZXIgaXMKPiBzYXZlZCBpbnRvIHJlZ3MtPm9y
aWdfYTAsIHNvIGEwIGNhbiBiZSBwcm9wZXJseSByZXN0b3JlZCBmb3IsCj4gZS5nLiBpbnRlcnJ1
cHRlZCBzeXNjYWxscy4KPgo+IFRoaXMgZnVuY3Rpb25hbGl0eSB3YXMgYnJva2VuIHdpdGggdGhl
IGludHJvZHVjdGlvbiBvZiB0aGUgZ2VuZXJpYwo+IGVudHJ5IHBhdGNoZXMuIEhlcmUsIGEwIHdh
cyBzYXZlZCBpbnRvIG9yaWdfYTAgYWZ0ZXIgY2FsbGluZwo+IHN5c2NhbGxfZW50ZXJfZnJvbV91
c2VyX21vZGUoKSwgd2hpY2ggY2FuIGNoYW5nZSByZWdzLT5hMCBmb3Igc29tZQo+IHBhdGhzLCBp
bmNvcnJlY3RseSByZXN0b3JpbmcgYTAuCj4KPiBUaGlzIGlzIHJlc29sdmVkLCBieSBzYXZpbmcg
YTAgcHJpb3IgZG9pbmcgdGhlCj4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIGNhbGwu
Cj4KPiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6IGVudHJ5OiBDb252ZXJ0IHRvIGdlbmVy
aWMgZW50cnkiKQo+IFJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJA
dnJ1bGwuZXU+Cj4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1
bGwuZXU+Cj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
PgoKVGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
