Return-Path: <SRS0=37yX=YQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE0ACA9EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 18:47:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713292086D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 18:47:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hg+PCOM5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bx+FYFHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713292086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iBqcNbPn9y59Jmw02yH7QLnFSDGWH5EIkfsH/ejfzfg=; b=Hg+PCOM5sRy9WImdYmABa2UYI
	j70/Ho6ph3yTI07Q2Kk0cfxBC3e5knK0M6Td+VZXHFk12GhS7ylVvfXaQEoGQaKtmLvN/SfI3rPHa
	GusYvQ50CPHgA8y/QLuFXerVMS07I6pPExEcJG6M3JrS08Hqx8eT+3PK2t0P+LXKnDRYfGKzMdh1R
	DUE0uoaHRCzT1tShS+b0fl9M2aw4jkoifxgxqhNDqyAt5WTH2yfZWaMOapNcMjbE+drgNnaT3RSar
	q+B17FNQ80a3FnyLUf6IYGm6pXA8m2Y5fhaOIh1D7iG9uV85FIHFyOOc0S1wlwS3c+oK76HRe5Hrm
	ah5ZBcO5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNLfM-0005NY-5O; Wed, 23 Oct 2019 18:47:28 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNLfI-0005NG-Rt
 for linux-riscv@lists.infradead.org; Wed, 23 Oct 2019 18:47:26 +0000
Received: by mail-il1-x144.google.com with SMTP id s75so10162066ilc.3
 for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2019 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=2shxzNpR8/ZWtNvQABYR3a+CWFRphbx4e1iqftgf3BA=;
 b=bx+FYFHkl/0CaE+YYG4ETlU+4sUGgk50KozxebRglRJsiumvP9PtfyEhGIlq4wtY1f
 7T7yzS9zdwhGl8Uyu5ZHfFEqKcfWitmRO+oTJTC9tB0j/YY7BfhR+425tNNWjA0g++2O
 89m79spXS/VqLpN7ocwVP/YGnagS1CG6/MQ9KlqWrmpfA6DPTS3OsE/jmAAZ1F1zdM2K
 KJiwtPqvbyl9e6+/4fWp6f6FtbNCVcNMo61q1coNnZbfFCJQ1rEBqijRV0YXmKieCcys
 vfTIKhnUNMBzjqXuCmXvPgOKKfPif2qSrpJzIXC/2X6FGjVHwKd9t6KTQdSHLHr2RtEh
 mMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=2shxzNpR8/ZWtNvQABYR3a+CWFRphbx4e1iqftgf3BA=;
 b=TMqiqE3G9/6pkQEZo/LVKZSYDNPm7AJF/jMS4yxxtqbYnLUtvUT4FC2aviZfmvGS3R
 GQONUzIcDvmgevROKiwfP+93yI6GCTMNyyccEySQSKtXO8aBaP5GlDBXIvZuFmCu4aKd
 N0amI0nAWV+xDnhjQKEL+zbuzw1tVzKGoGEbbrEtikAdKVMtWmFS8p3UOfE1suMcKk2j
 JXQLNKMTDkS1a8UWAPp/zUs/6mx5X7TACF1HA/UJEjJMY0Gv1NjMVN7aTXiDThe8Q4+U
 QOXi/pp6Oq9t2sJPd1gt7rL/z/sLAFlqu3tbjg0hxfD6ils22R0T21RhVyMEBuqGERRQ
 IHyg==
X-Gm-Message-State: APjAAAWpwxX2CYohfAusb+jPIas2dxjW84kBQ1aOiSx6WsKZ6Tr/BW7x
 ev2E4yK++Qy8yri64u+6r/ix3Q==
X-Google-Smtp-Source: APXvYqxeUdmNMFz0WV6H5NkUCsca/zAn4G+S3H9vQC1oBbZ76gGDfH//cc7eW5sA0jLA6GsaHz65ag==
X-Received: by 2002:a92:5d8d:: with SMTP id e13mr20888128ilg.32.1571856443788; 
 Wed, 23 Oct 2019 11:47:23 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id p16sm8637781iln.35.2019.10.23.11.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 11:47:23 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:47:21 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 1/2] riscv: Fix implicit declaration of 'page_to_section'
In-Reply-To: <20191023032302.160388-1-wangkefeng.wang@huawei.com>
Message-ID: <alpine.DEB.2.21.9999.1910231144480.16536@viisi.sifive.com>
References: <20191023032302.160388-1-wangkefeng.wang@huawei.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1971005253-1571856441=:16536"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_114724_909424_49D2ED5B 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Logan Gunthorpe <logang@deltatee.com>, Albert Ou <aou@eecs.berkeley.edu>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1971005253-1571856441=:16536
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 23 Oct 2019, Kefeng Wang wrote:

> With CONFIG_SPARSEMEM and !CONFIG_SPARSEMEM_VMEMMAP,
>=20
> arch/riscv/include/asm/pgtable.h: In function =E2=80=98mk_pte=E2=80=99:
> include/asm-generic/memory_model.h:64:14: error: implicit declaration of =
function =E2=80=98page_to_section=E2=80=99; did you mean =E2=80=98present_s=
ection=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   int __sec =3D page_to_section(__pg);   \
>               ^~~~~~~~~~~~~~~
>=20
> Fixed by changing mk_pte() from inline function to macro.
>=20
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Thanks for the fix, but this patch adds checkpatch errors:

---
ERROR: space required after that ',' (ctx:VxV)
#37: FILE: arch/riscv/include/asm/pgtable.h:187:
+#define mk_pte(page,prot)       pfn_pte(page_to_pfn(page),prot)
                    ^

ERROR: space required after that ',' (ctx:VxV)
#37: FILE: arch/riscv/include/asm/pgtable.h:187:
+#define mk_pte(page,prot)       pfn_pte(page_to_pfn(page),prot)
                                                          ^

total: 2 errors, 0 warnings, 0 checks, 11 lines checked
---

Please run 'checkpatch.pl --strict' on patches before submitting. =20

Anyway, these have been fixed up here and queued for v5.4-rc with Logan's=
=20
Reviewed-by:.


- Paul
--8323329-1971005253-1571856441=:16536
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1971005253-1571856441=:16536--

