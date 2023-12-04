Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF3C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 20:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f37Sx2AM8PCZoGOhK57a59g/gNfdfxpCnr0VVyyOCqI=; b=0i0S5w+kIB+D+z
	sDCPxnRPOSYd6XyFqQZN0HCsUx+sYN8i2QiyFHUV1GsJKiCrqBErNebSa6qL5jSr/lGiRY6FO52HU
	2N+YnIAFfcDhvru3fh8SpBMq8dYAb6Ykuf7tZ7lltdSKzG3l4kocSd+6uiRk+bsCQn7n0QV7iM9Rw
	rWJ5a9dD99PTstmIngsfem7paEXvd3CgmswgPqbmZ4C5f5gm/tcx9cDC3HbVp+leOxKZSU5H8eOuF
	RM8ypBmn35SSf5Elp7ZAa6Ap/DnmlKJdohIV/OqU4rSW5cd5NG4onAmEuSk0M6aukj0TH2n4lqJXJ
	LnUJ/j6BG9zq6lvVYypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFcO-005Ye4-2p;
	Mon, 04 Dec 2023 20:32:40 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFcM-005YdJ-0R
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 20:32:39 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4b2cf7ce00bso544658e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 12:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701721956; x=1702326756; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU+uMIFFgAmEpiU6c77Vf2nx1gSzq3cfvabr3WepOyQ=;
        b=KaDa8rDWWXRzk7x43YpTV0ss5PSKEVmX2W2nU2ZnzUnbvDIbRYsPr8yPxIxo8ZztLg
         7DN72BftGtMaOzQWNR+3C2KfjygN0PST+L5Apqo5TxNJrL0bcIm3W+3N7G9QUAli9wHQ
         PthsVVeZtgh2CDYYp3czUr9sft4UaoPOSJA46tNyzfZyMwVT3ZQBfFNCMh4HyothlC/F
         nwtzJmBfqDIw/ymDS47KV4CwJ4q06ALsNDdYAJmSDAmQ1LGMJNLrBPDzQVcYYyc3pvnx
         OU0YXk1xARIXLz9j0Dgz/fvUOZMXnBQa44/2Atz8dz/GxBHMY896frKX3wTJPGcXrx1V
         M9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701721956; x=1702326756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU+uMIFFgAmEpiU6c77Vf2nx1gSzq3cfvabr3WepOyQ=;
        b=CTZlFTSmIU+fG8f6Af8scZiVXtFyEdXBcLzOM8eGfpc/qcgsOZ7j84F2n2az2S+8n9
         B3DAxtmYLl/cEuIODStbp+52U71a75R8vR8e7xX5Rk6d5+RAcZYx20fWjOyehtT1KzT0
         00Hzl9DeT013pXCTgYgOj35qs0+2w6YyGCveiP1WBGUOdd/zSdEXhdce/O3qRR/GOejG
         JuqNe+TM780C8XdDl8zzhjgxBcMb0ltaU8KSy+d0AnDSJ2YkTdqyDdjJvLsImgb2z4tJ
         OVj5B7W9mp+4KmdqqpCnjgshXgqpTfjY+LsJ+jdEq5EUFaZPXC6jZn3ng8zZ+RSGnWAT
         p14w==
X-Gm-Message-State: AOJu0YwSv7OaLmSumBRe+z0T2vPgrAimuqoak3br/69Fl/cD/R+Oua8j
	nS4wVtFJ4dEvBaNdBpEDlNbZTHsgsmkhje9W/lE=
X-Google-Smtp-Source: AGHT+IGu0ngoxmxpANdg+qQKpT1lSXw3q29D5jHvOa6rqcTSWK4y8t6Y9zeQBCTCz8XSpMtwt41gbfNNdHaMja0WthQ=
X-Received: by 2002:a1f:c502:0:b0:4b2:87d3:4936 with SMTP id
 v2-20020a1fc502000000b004b287d34936mr3023418vkf.6.1701721955821; Mon, 04 Dec
 2023 12:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com> <20231127-module_linking_freeing-v4-2-a2ca1d7027d0@rivosinc.com>
In-Reply-To: <20231127-module_linking_freeing-v4-2-a2ca1d7027d0@rivosinc.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Dec 2023 20:32:10 +0000
Message-ID: <CA+V-a8thghtOuzSQ1gW9-_KCswtTpYyN09QbrYDMTnW79TOCNw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] riscv: Correct type casting in module loading
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ron Economos <re@w6rz.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Andreas Schwab <schwab@linux-m68k.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_123238_173358_13AA0D64 
X-CRM114-Status: GOOD (  14.93  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMTA6MDjigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFVzZSBfX2xlMTYgd2l0aCBsZTE2X3RvX2NwdS4K
Pgo+IEZpeGVzOiA4ZmQ2YzUxNDIzOTUgKCJyaXNjdjogQWRkIHJlbWFpbmluZyBtb2R1bGUgcmVs
b2NhdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZv
c2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBz
aWZpdmUuY29tPgo+IFRlc3RlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNp
Zml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KVGVzdGVk
LWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+ICNPbgpSWi9GaXZlIFNNQVJDIEVWSwoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxl
LmMKPiBpbmRleCA1MzU5M2ZlNThjZDguLmFhYzAxOWVkNjNiMSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5j
Cj4gQEAgLTU1LDcgKzU1LDcgQEAgc3RhdGljIGJvb2wgcmlzY3ZfaW5zbl92YWxpZF8zMmJpdF9v
ZmZzZXQocHRyZGlmZl90IHZhbCkKPgo+ICBzdGF0aWMgaW50IHJpc2N2X2luc25fcm13KHZvaWQg
KmxvY2F0aW9uLCB1MzIga2VlcCwgdTMyIHNldCkKPiAgewo+IC0gICAgICAgdTE2ICpwYXJjZWwg
PSBsb2NhdGlvbjsKPiArICAgICAgIF9fbGUxNiAqcGFyY2VsID0gbG9jYXRpb247Cj4gICAgICAg
ICB1MzIgaW5zbiA9ICh1MzIpbGUxNl90b19jcHUocGFyY2VsWzBdKSB8ICh1MzIpbGUxNl90b19j
cHUocGFyY2VsWzFdKSA8PCAxNjsKPgo+ICAgICAgICAgaW5zbiAmPSBrZWVwOwo+IEBAIC02OCw3
ICs2OCw3IEBAIHN0YXRpYyBpbnQgcmlzY3ZfaW5zbl9ybXcodm9pZCAqbG9jYXRpb24sIHUzMiBr
ZWVwLCB1MzIgc2V0KQo+Cj4gIHN0YXRpYyBpbnQgcmlzY3ZfaW5zbl9ydmNfcm13KHZvaWQgKmxv
Y2F0aW9uLCB1MTYga2VlcCwgdTE2IHNldCkKPiAgewo+IC0gICAgICAgdTE2ICpwYXJjZWwgPSBs
b2NhdGlvbjsKPiArICAgICAgIF9fbGUxNiAqcGFyY2VsID0gbG9jYXRpb247Cj4gICAgICAgICB1
MTYgaW5zbiA9IGxlMTZfdG9fY3B1KCpwYXJjZWwpOwo+Cj4gICAgICAgICBpbnNuICY9IGtlZXA7
Cj4KPiAtLQo+IDIuNDIuMAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
