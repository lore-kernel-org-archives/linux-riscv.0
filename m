Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CDDEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2a3sYWV9DgWwjVSyXIHuzaE4OHW2gibin4sn6W/wuc=; b=IFiPyeWTIITa74
	pislZ6AbjkGyA6tLfAVaOujKVbZzTmOkGvtJgUBQpRvg+dVsmhi8N+QjtkNV0j7kU5D0SpwWdPjmm
	/R5o+sXNhdiXttNkUphk6NjDMWeSioYqTwlDtiE3au6+jU4mPQ2I2IPl53gZMT1M2R21PRWFpuV72
	MBUQbJE5w9+/wC723R6Dpxff9U/njMj2ihLc/ClBNT1qRid2/V2BjiNZ48WuKRPxD6bZxh58v4VhT
	4CQE7aairEj4MvGebveRKfjD6tYbd3ksyB4Bh1DPPTnuL0S7yOB1ch/b1LovS8DpIwKmQEq8UxZby
	GqCErbm8ulYXs7VJ7XOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYtK-00GHBQ-0j;
	Wed, 28 Jun 2023 17:23:42 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYtG-00GHAZ-2u
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:23:40 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b69ed7d050so833101fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687973012; x=1690565012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqIqFUPFrsKoIzLWBGgp2HjNxkpNScvy103dAekNK5w=;
        b=iO+yzmLlBkR+O04yTgo80XMCjE1b80WI/5T4Qt+zTpN+zGPz5uUifYYcilgLFgMHlu
         KRxvTMs2ZdJ5lItvmKidStNdeww57cz5o093LHLryAOWX0mjEFxB/a5kzgIFkFBD3YlU
         +D1ZnbfS+sh+CSyY39sAcSRMdmntP6SsFXeNJU0rDO5cbX1P57xW5ZRi6WlYNSHkr0IQ
         arbyQtQnxWUZGkqsK0ZlsXC6Hpc6EC3nZ9MEER7r4rJ01FEkQzjNOSJ5nrkBS6KXOD+Y
         aq5OoGfAThvZRw/LqxpPX05JVvc7EhBP60vZwNHAEiCJXpHKfesydgdF0TUxzYFw98/8
         cNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687973012; x=1690565012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqIqFUPFrsKoIzLWBGgp2HjNxkpNScvy103dAekNK5w=;
        b=JajXQRW0mwDziAPBkxpaotHaBFVmkIqHucGlNmy+Jc7bI+YyUv3mrSh0C5/8L4La5T
         buiwJlz8TY1yixEYpbGlCjRZseQ6GtjG42tsFtuwQ6QBn4DYpZNhkAvT9ufif+cu4fxL
         xPE0N5dRv5jkVUg10MS05yF77T2UGF0gO2+2fG9Qiy+PT5uSsIVj08gD9usWesXUqUgn
         G/0hNpVkIWTTskiEnylLcF29n8yzSWUDvP9Q1stEs3vOsLxrPlYhESbrg2epiuxM74TO
         Mkk6PunYjSSh+ndPyAjUA7RU18WVDRo2NWSPgarisoB92vOrUTkJe2kd60z+Lx6b6yq8
         esvQ==
X-Gm-Message-State: AC+VfDzNX/ykcnZONYhMhL3LhFoUQosZT9auulEpSMbOpMdJ5y9p81g3
	+Pl6DXmBK/VOg0X7ZDVvnJ7yuB8brKqcz3jmj/3N4g==
X-Google-Smtp-Source: ACHHUZ79N/TpxztcIneHGSQv13tw7uydK8uMAMcNq7uhd3nC2sjwlTTVD5XfZdbpiDrun3fawZh0gaSMQ8wx9lp5nbA=
X-Received: by 2002:a05:6512:e9d:b0:4f9:b6f8:844f with SMTP id
 bi29-20020a0565120e9d00b004f9b6f8844fmr8662285lfb.39.1687973011995; Wed, 28
 Jun 2023 10:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230628131442.3022772-1-sameo@rivosinc.com> <20230628131442.3022772-2-sameo@rivosinc.com>
In-Reply-To: <20230628131442.3022772-2-sameo@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 28 Jun 2023 10:22:56 -0700
Message-ID: <CALs-HsuccHQiHEtJ+=s-YS0kHLhwOUnDUY7eP5W3BL2Lpx5+9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Jiatai He <jiatai2021@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_102338_960658_514D782B 
X-CRM114-Status: GOOD (  10.39  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgNjoxNeKAr0FNIFNhbXVlbCBPcnRpeiA8c2FtZW9Acml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEZyb206ICJIb25ncmVuIChaZW5pdGhhbCkgWmhlbmciIDxp
QHplbml0aGFsLm1lPgo+Cj4gUGFyc2UgWmIvWmsgcmVsYXRlZCBzdHJpbmcgZnJvbSBEVCBhbmQg
b3V0cHV0IHRoZW0gdG8gY3B1aW5mby4KPgo+IEl0IGlzIHdvcnRoIG5vdGluZyB0aGF0IHRoZSBT
Y2FsYXIgQ3J5cHRvIGV4dGVuc2lvbiBkZWZpbmVzICJ6ayIgYXMgYQo+IHNob3J0aGFuZCBmb3Ig
dGhlIFprbiwgWmtyIGFuZCBaa3QgZXh0ZW5zaW9ucy4gU2luY2UgdGhlIFprbiBvbmUgYWxzbwo+
IGltcGxpZXMgdGhlIFpia2IsIFpia2MgYW5kIFpia3ggZXh0ZW5zaW9ucywgc2ltcGx5IHBhc3Np
bmcgdGhlIHZhbGlkCj4gInprIiBleHRlbnNpb24gbmFtZSB0aHJvdWdoIGEgRFQgd2lsbCBlbmFi
bGUgYWxsIG9mIHRoZSAgWmJrYiwgWmJrYywKPiBaYmt4LCBaa24sIFprciBhbmQgWmt0IGV4dGVu
c2lvbnMuCj4KPiBBbHNvLCBzaW5jZSB0aGVyZSBjdXJyZW50bHkgaXMgbm8gbWVjaGFuaXNtIHRv
IG1lcmdlIGFsbCBlbmFibGVkCj4gZXh0ZW5zaW9ucywgdGhlIGdlbmVyYXRlZCBjcHVpbmZvIG91
dHB1dCBjb3VsZCBiZSByZWxhdGl2ZWx5IGxhcmdlLgo+IEZvciBleGFtcGxlLCBzZXR0aW5nIHRo
ZSAicmlzY3YsaXNhIiBEVCBwcm9wZXJ0eSB0byAicnY2NGltYWZkY196a196a3MiCj4gd2lsbCBn
ZW5lcmF0ZSB0aGUgZm9sbG93aW5nIGNwdWluZm8gb3V0cHV0Ogo+ICJydjY0aW1hZmRjX3pia2Jf
emJrY196Ymt4X3prbmRfemtuZV96a25oX3prcl96a3NlZF96a3NoX3prdCIuCj4KPiBUZXN0ZWQt
Ynk6IEppYXRhaSBIZSA8amlhdGFpMjAyMUBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBT
YW11ZWwgT3J0aXogPHNhbWVvQHJpdm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIb25ncmVu
IChaZW5pdGhhbCkgWmhlbmcgPGlAemVuaXRoYWwubWU+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVl
biA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
