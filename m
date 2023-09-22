Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F66CD4852
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBH6RTuKqzEMvbsdeFNpME1Vu7RosXu1eEbngsyRrMk=; b=KdEmj0Ic4Fc5Yw
	MFDNSooIfeEUFDYuDj/eURI2a6/hjVGNuicT7k60WIE8vW89c+SE+ukqAKpuBAzEPD+xEFxYWFJm0
	hptMf1fY8DGFreollKVuP7JlmPV3YnlcmzQ6qg0W5vgDAhNXzRj5GQSBOEPzCr4pH24ZhUi+hqvtL
	N/5StVl7uq2ThtPvfUPHjfR1YyBOl9yGoJIVwyzNK2euzmjQn9MFKydvgbnLrGvqSzFpk1iBAy/OQ
	UB7/6fCj6N36rjU2YNmIfs98OBMldT7HvMtA0ieOyKn6/cYSRQCKw3KWtn3p7JUbTvipFuR2FR1kk
	ML4G1jQp3hDmKAgkUGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjlWC-009gwC-2H;
	Fri, 22 Sep 2023 19:08:48 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjlW8-009gvT-1a
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 19:08:47 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7ab9488f2f0so154972241.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 12:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695409722; x=1696014522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7L9HvqDP5WJky24lmHONuk63n7kfCDpjCwpcpj0vxMA=;
        b=md4C+95rGIXUrCNJs1aT9FiFP8L0ij79KtdKAP8vOpJwuAqjaCqm+pVOdvhvx906Mw
         /F2CdgjLGWHaTjW3lFVc5WIaH9ACjjO+bV6H6tupzffwOQjJtN0O8i1A+B7wE8b4zIx6
         lPCmgmasadZbSsCrdXUS6ImsNwqv3WHA1WLXE1Y1sCUs8HJbJBfsVnua69/JihvOCVyG
         WYSydnXf6B9PwaTeUJdaKU0p/4HbeOMagQA2fMCSqiygTCNwe1lBhS3LMcb3DUcyV2sd
         IvL+iMi+c5Ay/2XUk+ACMWtHTf3I6ZOrwP5OCNuZNjK/0JkzZ5sliMSkhxIcoDiTdfSX
         WjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695409722; x=1696014522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L9HvqDP5WJky24lmHONuk63n7kfCDpjCwpcpj0vxMA=;
        b=UpVnG9tgFC56vI6LBhmDIfkPWk1qAlZ6QJZvMS3qpY/5G9/p/eiJ2fOjYw1u8oOfmC
         Bycxroo+6Lp4NQ1uHSm9Z65D2NmadpcigoxXwsZJPL2OZ8tUE56bP6XUT9c9knbRz2od
         rkXElvSbJGPGgA9U43eIhbjcyc8nIoL0nccgjwJRI17N3Q2RI4q78PX/IgFQ7R4U9WGC
         c3Ma0Imm0Mz3r92w0W+C49TklPqc67Rt7GZyaNHCMNxVTMevBPrJVl7Dnoo9aTkrC1Ws
         sYh/cLvUgqUw+CHMwm+qcGZCSSXS+JjxTAG1dRh6Kb98nhGnOIUVo2z5JV69GGNoUSlu
         h6Uw==
X-Gm-Message-State: AOJu0Yx8B00dhvraRSsulE89gmPQjiXZlyaLe6DadjRol/hRfSN6YG8t
	7ZLRRNZDu3ASy285QyMSqeFFVQDbnoxOztu0sdw=
X-Google-Smtp-Source: AGHT+IEIuHwatFh1RJWylUlf8xGj74/AAV7K6EqAqxS9YaAsvTvQZCNSlpedgXwBetK5NHqFPcDAKpBDiR2hEQSg3vk=
X-Received: by 2002:a1f:ed45:0:b0:490:29bb:670b with SMTP id
 l66-20020a1fed45000000b0049029bb670bmr114533vkh.12.1695409722407; Fri, 22 Sep
 2023 12:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
In-Reply-To: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 22 Sep 2023 14:08:16 -0500
Message-ID: <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
To: Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_120844_572198_8525E54C 
X-CRM114-Status: GOOD (  20.11  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgODo1MeKAr1BNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhl
IGVNTUMgb24gdGhlIEJlYWdsZVYgQWhlYWQgYW5kIHRoZQo+IFNpcGVlZCBMaWNoZWVQaSA0QS4g
VGhpcyBhbGxvd3MgdGhlIGtlcm5lbCB0byBib290IHdpdGggdGhlIHJvb3RmcyBvbgo+IGVNTUMu
Cj4KPiBJIHRlc3RlZCBvbiB0b3Agb2YgdjYuNi1yYzIgd2l0aCB0aGlzIGNvbmZpZyBbMV0uIEkg
d2FzIGFibGUgdG8gYm9vdAo+IGJvdGggdGhlIEFoZWFkIFsyXSBhbmQgTFBpNGEgWzNdIGZyb20g
ZU1NQy4gVGhlIGZvbGxvd2luZyBwcmVyZXF1aXNpdGVzCj4gYXJlIHJlcXVpcmVkOgo+Cj4gICBb
UEFUQ0ggdjJdIHJpc2N2OiBkdHM6IHRoZWFkOiBzZXQgZG1hLW5vbmNvaGVyZW50IHRvIHNvYyBi
dXMgWzRdCj4KPiBJIHB1c2hlZCBhIGJyYW5jaCBbNV0gd2l0aCB0aGlzIHBhdGNoIHNlcmllcyBh
bmQgdGhlIGFib3ZlIHBhdGNoIGZvcgo+IHRob3NlIHRoYXQgZmluZCBhIGdpdCBicmFuY2ggZWFz
aWVyIHRvIHRlc3QuCj4KPiBQbGVhc2Ugbm90ZSB0aGF0IG9ubHkgdGhlIE1NQyBjb250cm9sbGVy
IGNvbm5lY3RlZCB0byB0aGUgZU1NQyBkZXZpY2UKPiBpcyBlbmFibGVkIGluIHRoZSBkZXZpY2Ug
dHJlZXMgZm9yIHRoZXNlIHR3byBib2FyZHMuIEkgZGlkIG5vdCB5ZXQKPiBhdHRlbXB0IHRvIGNv
bmZpZ3VyZSBhbmQgdXNlIHRoZSBtaWNyb1NEIGNhcmQgc2xvdC4gTXkgcHJlZmVyZW5jZSBpcyB0
bwo+IGFkZHJlc3MgdGhhdCBpbiBhIGZ1dHVyZSBwYXRjaCBzZXJpZXMuCj4KPiBSZWZlcmVuY2Vz
Ogo+IFsxXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9wZHA3LzVmYmRjZjJhNjVlYjFhYmRkM2Ey
OWQ1MTljMTljZGQyCj4gWzJdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvOTFhODAxYTVm
OGQxMDcwYzUzNTA5ZWRhOTgwMGFkNzgKPiBbM10gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRw
Ny8xNDQ1YzNjOTkxZTg4ZmQ2OWM2MDE2NWNlZjY1NzI2YQo+IFs0XSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxMjA3MjIzMi4yNDU1LTEtanN6aGFuZ0BrZXJuZWwu
b3JnLwo+IFs1XSBodHRwczovL2dpdGh1Yi5jb20vcGRwNy9saW51eC90cmVlL2I0L3RoMTUyMC1t
bWMKClRoaXMgcGF0Y2hzZXQgY2FtZSBvdXQgdmVyeSBuaWNlIQoKdjYuNi1yYzIgd2l0aCBMYXN0
IFJGQyB2MjoKClsgICAgNC4wNjY2MzBdIG1tYzA6IFNESENJIGNvbnRyb2xsZXIgb24gZmZlNzA4
MDAwMC5tbWMKW2ZmZTcwODAwMDAubW1jXSB1c2luZyBQSU8KCmRlYmlhbkBCZWFnbGVWOn4kIHN1
ZG8gaGRwYXJtIC10VCAvZGV2L21tY2JsazAKCi9kZXYvbW1jYmxrMDoKIFRpbWluZyBjYWNoZWQg
cmVhZHM6ICAgMTUxNiBNQiBpbiAgMi4wMCBzZWNvbmRzID0gNzU4LjA5IE1CL3NlYwogVGltaW5n
IGJ1ZmZlcmVkIGRpc2sgcmVhZHM6ICA4NCBNQiBpbiAgMy4wMSBzZWNvbmRzID0gIDI3Ljk0IE1C
L3NlYwoKdnMgdjYuNi1yYzIgd2l0aCB0aGlzIHBhdGNoc2V0OgoKIFsgICAgNC4wOTY4MzddIG1t
YzA6IFNESENJIGNvbnRyb2xsZXIgb24gZmZlNzA4MDAwMC5tbWMKW2ZmZTcwODAwMDAubW1jXSB1
c2luZyBETUEKCmRlYmlhbkBCZWFnbGVWOn4kIHN1ZG8gaGRwYXJtIC10VCAvZGV2L21tY2JsazAK
Ci9kZXYvbW1jYmxrMDoKIFRpbWluZyBjYWNoZWQgcmVhZHM6ICAgMTU4MCBNQiBpbiAgMi4wMCBz
ZWNvbmRzID0gNzkwLjk3IE1CL3NlYwogVGltaW5nIGJ1ZmZlcmVkIGRpc2sgcmVhZHM6IDQxOCBN
QiBpbiAgMy4wMCBzZWNvbmRzID0gMTM5LjExIE1CL3NlYwoKUmVnYXJkcywKCi0tIApSb2JlcnQg
TmVsc29uCmh0dHBzOi8vcmNuLWVlLmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
