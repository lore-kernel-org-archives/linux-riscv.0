Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABC3C3601B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35fezQwI4yKiV0Bns42OUCd7GWKDlhPbtKdKAHZyabY=; b=WFW4aJDANIdK7U
	+tmmYLeQvuKE9HvHs0yJIX+aWHcZHzPYkGnOOM+JrXXFVB+da60Ui/W+O0wSr/PtAo9DOGT6xDfX1
	HI+jPatxZ/MwEyzd7KFuXkqy9hzgoZ33ljQksUJrRL8jN39OJ5pVLtmohJ2P2ScId3NhBWXyzjwov
	3Krpb6lOxeJT24r7zez6wavu8dQGz9f/G1fxTnVaeqqwPf/fWG8o5zbvZWd+2eVXRJZt6aKKHoyZJ
	Lo9HhwQ3o1qOL8DwWPnKCI6Mk1AVOOe2ch+fy1M++xDLIP5oD59SNfq0MG2R0c/Hs25JPLfBeaIyg
	YK6uhXT0yh6E2Y3LRHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYTp-00000002YoF-3V6x;
	Tue, 01 Apr 2025 10:04:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXtr-00000002TSk-2b9k
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 09:27:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-301cda78d48so9479572a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743499635; x=1744104435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Uado/lwoP6/yzxDnZMmcfqF7svpEZg92uh1rPCCI/A=;
        b=1XU/ykFfWAsGS0nDHLF38nqu++FLgWZKEzhnFtvBiMldGPOuiulpMSzdvn4SbNDnAJ
         fZ7eYgrA+YpkKtdTAYOcAaojZo9Cp4fGpMy1xt8NA5hDarpvuUWLDMe0cjgMe+8Io0QK
         8oPyK1uLn20btp0u26WIEhvFCinnbfA9UomD/m2lSjGX2pYlOKv87xCd4g5M9vYvBX6h
         Q0apsHV0rya+6KsHp0U8IWLwgmIVPxt3C+1sjsVAeC9bd978C13UaGMAIOGigJ9LtEj4
         dq0ixTXDwNy5pMy7dMsRxX6AuSBkRMVyNCmx/xNcV38MQ16AOZRKgUZ4YWp7cdYPS2Rq
         YgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743499635; x=1744104435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Uado/lwoP6/yzxDnZMmcfqF7svpEZg92uh1rPCCI/A=;
        b=U72/dQvJtWY11DaHZ9imlxqRayc82DAC4+XOQ+a4QLCTTsoS7iwM8WkkB1BuKTWiV6
         eB1sF7PtyQGOFAVcW2vmBT4sZT4kxz6GTxUyYMnLd0BLJXJFormhLvFc6y4pZ4AlresE
         +CUpBSToMicPsLJ0ZGsLT7bLnEyKktCvHUVkgXbvrODx7NJGQoR99+yOOH4X82T9/ZhV
         HlHujYSvz7QfE6xVf1gbcPrQ4ARcYIdyAT1vKbP5RKONl/6xjIZsCUy1XhjIduYV1k3G
         dxSdyaaIF/js+oHMLoEyRxRBS4EdH6RoW2y269fYAU7E6DJQoca56kvtmQ7Y9A3ymOWk
         UgyQ==
X-Gm-Message-State: AOJu0YzRltvCGdQk75vNkpU1aFW2Vo4HSbRU5sxq7Z/GVx3skPxKxxkH
	0FX/PK3NYU+alUu6J8CkDOlYEHDsFpDCajv0ERrSTrXeUbmHmzytk3Dl44jMx/E=
X-Gm-Gg: ASbGncsSY16KrQX87isrKddDVkblPcS2J2ZKgZ9GndPqbCfSYddMLVIyD/ixnZe8sMb
	/2B7tUKGlvhmICMIIJtkntXJmDcQrydK76dHhpQBqi5AGZFIZf3I/eqDTO6ReGuY/abtR6G0SXl
	Lg/fOydJxQM+nih6NVUcyLzIQM4ROLmDGsRCo2Iox8u4FfHn9FnEb0Qz+RKw1Wvj6sdwJu9HGXJ
	rpYZ54x4MFRmBreCJ35RUDCDn+BtvtSyIfoD4Dep14Mo4Q/disLkGRO803IuDEm/JmdQvjEQMrD
	UKrrKVkvnIHFkhg48TtMb/WGVnwITeaEuwJW8XI6KyN+8RG0h3UVzOOQTJ0E57g24p1CI0m9kYh
	LQCXYc83qn06Pty6d
X-Google-Smtp-Source: AGHT+IGqaCCTYrqWmclHIKooaJS6kAOzFT7W0prKClRtoHu3FK+uWwiXhw0KuQp6tmIfbZ4lKt34fg==
X-Received: by 2002:a17:90b:56cb:b0:2f6:f32e:90ac with SMTP id 98e67ed59e1d1-30531fa159emr21548695a91.11.1743499634871;
        Tue, 01 Apr 2025 02:27:14 -0700 (PDT)
Received: from ?IPV6:2001:861:3380:2e20:6214:6f9b:8e4c:f723? ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039e10af2csm11190566a91.21.2025.04.01.02.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:27:14 -0700 (PDT)
Message-ID: <f8b56a02-c508-4bc9-a503-48e487ced86e@rivosinc.com>
Date: Tue, 1 Apr 2025 11:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime
 const
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Klara Modin <klarasmodin@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_022715_919817_12C5B888 
X-CRM114-Status: GOOD (  11.94  )
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

CgpPbiAzMS8wMy8yMDI1IDIwOjQ1LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gLm9wdGlvbiBh
cmNoIGNsb2JiZXJzIC5vcHRpb24gbm9ydmMuIFByZXZlbnQgZ2FzIGZyb20gZW1pdHRpbmcKPiBj
b21wcmVzc2VkIGluc3RydWN0aW9ucyBpbiB0aGUgcnVudGltZSBjb25zdCBhbHRlcm5hdGl2ZSBi
bG9ja3MgYnkKPiBzZXR0aW5nIC5vcHRpb24gbm9ydmMgYWZ0ZXIgLm9wdGlvbiBhcmNoLiBUaGlz
IGlzc3VlIHN0YXJ0cyBhcHBlYXJpbmcgb24KPiBnY2MgMTUsIHdoaWNoIGFkZHMgemNhIHRvIHRo
ZSBtYXJjaC4KPiAKPiBSZXBvcnRlZCBieTogS2xhcmEgTW9kaW4gPGtsYXJhc21vZGluQGdtYWls
LmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3Np
bmMuY29tPgo+IEZpeGVzOiBhNDRmYjU3MjIxOTkgKCJyaXNjdjogQWRkIHJ1bnRpbWUgY29uc3Rh
bnQgc3VwcG9ydCIpCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY2M4ZjM1
MjUtMjBiNy00NDViLTg3N2ItMmFkZDI4YTE2MGEyQGdtYWlsLmNvbS8KPiAtLS0KPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmggfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9ydW50aW1lLWNvbnN0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3J1bnRpbWUtY29uc3Qu
aAo+IGluZGV4IGMwN2QwNDlmZGQ1ZDI5OTljNTdkOGE5MGU3MzYzODI5YzU0NjIzNjguLjQ1MWZk
NzZiODgxMTUyOTE5ZjIyZGU4ZjVjNTZiNTExNzFhY2JmM2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3J1bnRpbWUtY29uc3QuaAo+IEBAIC01Niw2ICs1Niw3IEBACj4gICNkZWZpbmUgUklT
Q1ZfUlVOVElNRV9DT05TVF82NF9aQkEJCQkJXAo+ICAJIi5vcHRpb24gcHVzaFxuXHQiCQkJCQlc
Cj4gIAkiLm9wdGlvbiBhcmNoLCt6YmFcblx0IgkJCQkJXAo+ICsJIi5vcHRpb24gbm9ydmNcblx0
IgkJCQkJXAoKSGV5IENoYXJsaWUsCgpDb3VsZCAiLm9wdGlvbiBhcmNoLCt6YmEsLWMiIGJlIHVz
ZWQgYXMgd2VsbCA/IFRoYXQgd2F5LCBjIGlzIHRyZWF0ZWQKbGlrZSBhbnkgb3RoZXIgYXJjaCBv
cHRpb24uIE9yIGRvZXMgbm9ydmMgaGFzIG90aGVyIHNpZGUgZWZmZWN0cyA/CgpUaGFua3MsCgpD
bMOpbWVudAoKPiAgCSJzbGxpCSVbX190bXBdLCVbX190bXBdLDMyXG5cdCIJCQlcCj4gIAkiYWRk
LnV3ICVbX19yZXRdLCVbX19yZXRdLCVbX190bXBdXG5cdCIJCQlcCj4gIAkibm9wXG5cdCIJCQkJ
CQlcCj4gQEAgLTY1LDYgKzY2LDcgQEAKPiAgI2RlZmluZSBSSVNDVl9SVU5USU1FX0NPTlNUXzY0
X1pCS0IJCQkJXAo+ICAJIi5vcHRpb24gcHVzaFxuXHQiCQkJCQlcCj4gIAkiLm9wdGlvbiBhcmNo
LCt6YmtiXG5cdCIJCQkJXAo+ICsJIi5vcHRpb24gbm9ydmNcblx0IgkJCQkJXAo+ICAJInBhY2sJ
JVtfX3JldF0sJVtfX3JldF0sJVtfX3RtcF1cblx0IgkJCVwKPiAgCSJub3Bcblx0IgkJCQkJCVwK
PiAgCSJub3Bcblx0IgkJCQkJCVwKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogYjIxMTdiNjMwYzQ4
YmU2OWQyNzgyZWQ3OWZlZmUzNWRjZDE5MmNlNgo+IGNoYW5nZS1pZDogMjAyNTAzMzEtZml4X3J1
bnRpbWVfY29uc3Rfbm9ydmMtNDA3YWYxZjI0NTQxCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
