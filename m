Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD142CE7AAE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 10:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZxLqgannlr5nU9zD1LJBDl0Hw+Gsdb2OTLcJvYwI50=; b=emButZDDAXZWEd
	5stYbza8cn8Ur5TFQGMyEgzUvaVYmuCBywqFLAvoTmnzP8t4HmmcpMK88q0hQxvZnap2CvHcPgKkf
	+JG6JLk06FlTZRkpBW0/EKQKpSNm2i5iEzuGNRAMNPqOMHQSawTRCLwTzyX3BftWhFatIjcSneGIJ
	+nPTi1VxgvLNGmB2yLPEedqMj/BsecZppbAtvVv++4zPjlUR3fLQHMMETf9mCwGfJeb2p6/vWvhVY
	/KTeSihQ4eQMFZledNGv4v4A1DZqqA+EQQFNXg13Pok76+M234zU7gOF5dwAHbISWPKAJnz0z97Np
	kJ2x3GQMmgGIKRfLXGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrVy-0000000C4bn-2jrf;
	Fri, 14 Nov 2025 10:58:50 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrVv-0000000C4bA-2LSI
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 10:58:49 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-37a415a22ecso15282481fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 02:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763117925; x=1763722725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moct8oK8oTbFIKdj9gmba82CoQn6tiSrpePvUZCPRVw=;
        b=P7WIWHh42FiwR0vBsCL8+pACqHtM7NjDQp6Oq/Yh5VCT3+YE4DDKpaI5BXZmDQt/kk
         ROcPPN0CN263xrOnCtgvydnxnXD1yiM/iQwoXujDDgk4KmPOsmv5t/IDDE6Yu0xJcCBo
         Q0+7WsB/KQH1q35d67csm10YhsXLFgPxa8//fzMn+UsLytabiEsAlUgz5LMTpyFtWLZc
         AhepxoouHZYrSczxFez0RNoADS4iDos3a5ZONkc+uC57O8eizShD/tK44iQrgLXnWyBK
         hyM0BytCWQetxAnSmHNdDj22/zs5rqQ73qTceOHx2PwBlxAEhZF/s5vIXgKq5p+v1VJ4
         1MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117925; x=1763722725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=moct8oK8oTbFIKdj9gmba82CoQn6tiSrpePvUZCPRVw=;
        b=SAanhGp3efLDJoZBEPzg5ASTTkxQzPEB1aw5jk8f+u5JWepElafOggsOKmD5ZFBl+4
         NEemP0RwLtjsz+z4gsKm/bMxmEU3vaQsQ/wnOtNmwhDpRStm0b+weHsl74P/3sLEuwVI
         sVRIeoZnmAnAlqKQZFYe2kRcFDUCBGfeb4IhIl3uqxfgw12jVKBM5TM7ghLNqCkETCBW
         5GbLhkpdVHFljQVEhQ0QliZWM3z9PPpal/ct7j0N+ieBSJAvOo4IQJZ61BqAYGKybJvZ
         DlUTMSAQmNcUUyi1Hj3No5HTV74drABhERPp2UyWJixrpZcUM+Jpq9JNxlo0Qiup1vrT
         7edw==
X-Forwarded-Encrypted: i=1; AJvYcCVK/PJUEEZkc3B1Q2DRkWKrc2VWFeg0yt3srFAfY31WQwzHoxeKm2z/XE5bttsBq5oXgkDA2OLcnOjj9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEmAvH8lK1sI1YqkgHxxsCkeGG7lluAHwnBsBkEHifBkJkA1Df
	FKt05mVMD91CEXftmf0AvjvjuCklrlrTeOMcNqY7rXpG6rlixzZw7wjF++70OoT2b4LLN86wgZM
	Y2TUXW4cqJb2jkmd+VFluruUMb1fA3k4004ohHwhZx/gUdyon+foGS2A=
X-Gm-Gg: ASbGncsA8nGjKNAIuTJPkYWoRZgGW/lq07L+jLGGsY0xAcuJSkvxffV7KcPKk8pMFaz
	vMudj6473HhT4j7PY9jEoTRkI+ynzoY0iA5PIP6vr8nKb7xEV+hYYlPUBFqin0JUVaoVEmKS8OW
	wK1iD1obiC08BgFQ+DMwFTYpRFdOCrOwD4LC89C9pAK8yIEUFuUSUlba2e1neBajWr9dpvz8R/V
	CqRioMV9AaX4EojbrHbR+lOpTELiwGitxxmzdSXlxqHenibt0DGNRS8lV1HO2Wr2DVLr1Yz
X-Google-Smtp-Source: AGHT+IHtWv3j/kZRqGPNIwLqySl8Dn60GDM67CrGNpEV2WqP6UiTqoAfeRJbMH3DmWBDQD/LXQzpcCWrrkYqNy5pYQ4=
X-Received: by 2002:a2e:be8a:0:b0:37a:5c3c:1332 with SMTP id
 38308e7fff4ca-37b9b120886mr19565341fa.14.1763117925382; Fri, 14 Nov 2025
 02:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20251114065808.304430-1-mchitale@ventanamicro.com>
In-Reply-To: <20251114065808.304430-1-mchitale@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 14 Nov 2025 16:28:33 +0530
X-Gm-Features: AWmQ_bkJBRYtzHMKgVk5_MpRdU9UJqxxzNv1iyYVUyrewdYSmK-fvYMuEe14jZU
Message-ID: <CAK9=C2X_mF+h8_K_jBZ6o==GUqZyna9yPn0NgMdXYQ1VxJdSwA@mail.gmail.com>
Subject: Re: [PATCH] riscv: sbi: Prefer SRST shutdown over legacy
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Davis <afd@ti.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_025847_771818_B7AFD544 
X-CRM114-Status: GOOD (  20.53  )
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

T24gRnJpLCBOb3YgMTQsIDIwMjUgYXQgMTI6MjnigK9QTSBNYXl1cmVzaCBDaGl0YWxlCjxtY2hp
dGFsZUB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIHNiaV9pbml0
KCkgYWx3YXlzIGF0dGVtcHRzIHRvIHJlZ2lzdGVyIHRoZSBsZWdhY3kgc2h1dGRvd24KPiBmdW5j
dGlvbiBhcyB0aGUgc3lzLW9mZiBoYW5kbGVyIHdoaWNoIGlzIGZpbmUgd2hlbiBSSVNDVl9TQklf
VjAxIGlzIG5vdAo+IGVuYWJsZWQuIEhvd2V2ZXIsIGlmIFJJU0NWX1NCSV9WMDEgaXMgZW5hYmxl
ZCBpbiB0aGUga2VybmVsIGFuZCB0aGUgU0JJCj4gdjAuMSBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRo
ZSB1bmRlcmx5aW5nIFNCSSBpbXBsZW1lbnRhdGlvbiB0aGVuIHRoZQo+IGxlZ2FjeSBzaHV0ZG93
biBmYWlscy4gRml4IHRoaXMgYnkgbm90IHJlZ2lzdGVyaW5nIHRoZSBsZWdhY3kgc2h1dGRvd24K
PiB3aGVuIFNSU1Qgc2h1dGRvd24gaXMgYXZhaWxhYmxlLgo+Cj4gRml4ZXM6IDcwZGRmODZkNzZj
MSAoInJpc2N2OiBzYmk6IFN3aXRjaCB0byBuZXcgc3lzLW9mZiBoYW5kbGVyIEFQSSIpCj4gU2ln
bmVkLW9mZi1ieTogTWF5dXJlc2ggQ2hpdGFsZSA8bWNoaXRhbGVAdmVudGFuYW1pY3JvLmNvbT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jIHwgNiArKysrKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMKPiBpbmRleCA1ZThjZGUwNTUyNjQuLmM0NDMzMzcwNTZhYiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zYmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gQEAg
LTY0OCw5ICs2NDgsOSBAQCBpbnQgc2JpX2RlYnVnX2NvbnNvbGVfcmVhZChjaGFyICpieXRlcywg
dW5zaWduZWQgaW50IG51bV9ieXRlcykKPgo+ICB2b2lkIF9faW5pdCBzYmlfaW5pdCh2b2lkKQo+
ICB7Cj4gKyAgICAgICBib29sIHNyc3RfcG93ZXJfb2ZmID0gZmFsc2U7Cj4gICAgICAgICBpbnQg
cmV0Owo+Cj4gLSAgICAgICBzYmlfc2V0X3Bvd2VyX29mZigpOwo+ICAgICAgICAgcmV0ID0gc2Jp
X2dldF9zcGVjX3ZlcnNpb24oKTsKPiAgICAgICAgIGlmIChyZXQgPiAwKQo+ICAgICAgICAgICAg
ICAgICBzYmlfc3BlY192ZXJzaW9uID0gcmV0Owo+IEBAIC02ODMsNiArNjgzLDcgQEAgdm9pZCBf
X2luaXQgc2JpX2luaXQodm9pZCkKPiAgICAgICAgICAgICAgICAgICAgIHNiaV9wcm9iZV9leHRl
bnNpb24oU0JJX0VYVF9TUlNUKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHByX2luZm8o
IlNCSSBTUlNUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnaXN0ZXJfcGxhdGZvcm1fcG93ZXJfb2ZmKHNiaV9zcnN0X3Bvd2VyX29mZik7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgc3JzdF9wb3dlcl9vZmYgPSB0cnVlOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHNiaV9zcnN0X3JlYm9vdF9uYi5ub3RpZmllcl9jYWxsID0gc2JpX3Nyc3Rf
cmVib290Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9zcnN0X3JlYm9vdF9uYi5wcmlv
cml0eSA9IDE5MjsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZWdpc3Rlcl9yZXN0YXJ0X2hh
bmRsZXIoJnNiaV9zcnN0X3JlYm9vdF9uYik7Cj4gQEAgLTcwMiw0ICs3MDMsNyBAQCB2b2lkIF9f
aW5pdCBzYmlfaW5pdCh2b2lkKQo+ICAgICAgICAgICAgICAgICBfX3NiaV9zZW5kX2lwaSAgPSBf
X3NiaV9zZW5kX2lwaV92MDE7Cj4gICAgICAgICAgICAgICAgIF9fc2JpX3JmZW5jZSAgICA9IF9f
c2JpX3JmZW5jZV92MDE7Cj4gICAgICAgICB9Cj4gKwo+ICsgICAgICAgaWYgKCFzcnN0X3Bvd2Vy
X29mZikKPiArICAgICAgICAgICAgICAgc2JpX3NldF9wb3dlcl9vZmYoKTsKPiAgfQo+IC0tCj4g
Mi40My4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
