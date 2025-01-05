Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC4AE77197
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jan 2025 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wxu8o88ZLy55oDZR19a6mGJZsKgRxHrRbMJ7CL+qtJQ=; b=vOWJVgSjxeAcPw
	c2CXQdM30CKs2iu0A4eb8zl/t8IeBKz161d0SrulxS1UTrHEQCClcsU2T5F8W6g3V6KAgDk1wDe2R
	ZODYrHpHOdgMETTkmQmxZ+v6R/bwkENa3bm0+qzaepMJqf7Bdps9jlfAL3mzep95Bc/vVrT6WrOOp
	DY5sqRQ+v3fDzhP210CPqnTY+0sYxHMtePAHoZCQeRxBycZ4S5Dlb+Mo8ENcdz5UDcdQxiTPhRltJ
	QeVnto7gjqsl8/fEzVrDkQciePMfsDPeemk4umtrkeB8WmGhqkLcr6YBbBaawbosK8TmyyiFOgT7Y
	0zOWxETajtjpfWVqwKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTRm-0000000H5Wb-1QqE;
	Sun, 05 Jan 2025 16:25:50 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTRj-0000000H5Vx-3SoR
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jan 2025 16:25:48 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso14353848a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jan 2025 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736094346; x=1736699146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqRDxETieKo+8LV73GKB3gXqTd/uCkmgBGJiOO4mOFg=;
        b=PzoaOxmA7FbTzDxQJWhtx0F7Tfg+x3b+uwObahXloh5LtFdZk5WXXZHHHJfJHc4i8S
         jZK5GBEvru76tjkP48XhRwk9TtH4vUsYZxjDjmjq8RbnWlnFPIHhkNsarDI2iCIRK3OM
         zhZ+aSzJWLG+0/u7gIcENBvuBXvEj6G6CGcbcKIuQA9AazN/HohtuR/+zhAOEtmee+ox
         6JFrHUaF7WxWKHH48szJ/gaw7aYs03bfFQDr8K4gfDRIt1Hk5iXYBr6+dL2GiL1uX4al
         NeZcLshG0NoCdiSg8CzYOOfrgDXwkNMn0oBAmVbxjyFsV/6kUDGfr5AT45EoYQrBgtu4
         udqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736094346; x=1736699146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqRDxETieKo+8LV73GKB3gXqTd/uCkmgBGJiOO4mOFg=;
        b=nqfCkbR/Cf91/T0BsGiWZS6R1GfiqXHIHrPl1eeUxrQxsWVxfLqyoptfRc9FT8UcL9
         Mtt+Twl+ADoycAaDJgTkxnXsD+sP+OqdHtuxMZKiNJSGnjOn9mTRwUM74+u3IqMRzd7F
         WjxEDYtWlSYTPQOJIYnxYUakU/qsRtDsdzZW6Pac6/+6Xc5TeaMRUMEsWK3wT5yD+1mP
         xFiA1pRiOGPKan8G7uq9NAhyb4s+68QIGuHRJg6t4NfThOHfMNGFssddPvAE4f3fF+nc
         9GdZtzvcu08SPuaDzcryK+Lr4Y6R3RnIhyMKctNNsdQ3vb8dHT+T4Kx6fjmpFXJDIn2X
         jv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBpQvquhTvQQdwJJ1WfIPcolUZsgvrf80yjwy/ejgrD3iQzZtUHuTR8/G2/JJiVaHlZRdIyC9EAeACjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcUDe2xsvo4t66rODfshcSnC3lp9XC44wlP0P+OgJG1oeWWndE
	++8Adbw/kJxzYHLnn3hOUQNB+COu0dz8eqRM0MmVWe76G/cJX6B54rOnk+WdduOV6kV02pyHxxp
	ySkjthTiTd4s/BJn0ENyhesrEDZU=
X-Gm-Gg: ASbGnctcinTZ444CQOkT18ZrAn3OcfOWOvALt5MNODt+sPOYQN0rUVXbxDptVrrDcCm
	MvuEje+HngW+gbDYDEPTC7fPzUS1TBgvvHjxpzEg=
X-Google-Smtp-Source: AGHT+IH2+khpZuwV/UXGR/BF5U6xqgXLMlviIw4B+TtjMphMUGOjhladr0Lh2wSn3HqLSS5KQs2I5FOW+J2wTf7Ziqs=
X-Received: by 2002:a17:90b:54d0:b0:2ee:c918:cd60 with SMTP id
 98e67ed59e1d1-2f452e4a7f6mr85268600a91.20.1736094346461; Sun, 05 Jan 2025
 08:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20241220091730.28006-1-yongxuan.wang@sifive.com>
In-Reply-To: <20241220091730.28006-1-yongxuan.wang@sifive.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 6 Jan 2025 00:25:35 +0800
Message-ID: <CAFTtA3Op9go6pi6Om=e+hXGAfMGv_kGeS4CfqXbdVhLcRW89ew@mail.gmail.com>
Subject: Re: [PATCH 0/2] selftest: fix riscv/vector tests
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_082547_861403_58CDC499 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

WW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4g5pa8IDIwMjTlubQxMuac
iDIw5pelIOmAseS6lCDkuIvljYg1OjE35a+r6YGT77yaCj4KPiBBZGQgdGVzdCBjb3VudHMgYW5k
IHBhc3MgbWVzc2FnZSB0byByZW1vdmUgd2FybmluZyBvZiByaXNjdi92ZWN0b3IgdGVzdHMuCj4K
PiBZb25nLVh1YW4gV2FuZyAoMik6Cj4gICB0b29sczogc2VsZnRlc3RzOiByaXNjdjogQWRkIHBh
c3MgbWVzc2FnZSBmb3Igdl9pbml0dmFsX25vbGliYwo+ICAgdG9vbHM6IHNlbGZ0ZXN0czogcmlz
Y3Y6IEFkZCB0ZXN0IGNvdW50IGZvciB2c3RhdGVfcHJjdGwKPgo+ICB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGliYy5jIHwgNCArKysrCj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92c3RhdGVfcHJjdGwuYyAgICAgfCAyICsr
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiAtLQo+IDIuMTcuMQo+CgpG
b3IgdGhlIHNlcmllcywKClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPEFuZHlibkFDQGdtYWlsLmNv
bT4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
