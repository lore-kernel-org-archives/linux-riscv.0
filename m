Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31E9C54ED1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHTBBdJbC7IPBor4JAt6brcyRSNYn6uySDc/LchOZnU=; b=sr7IfqWtS6dYxP
	I+c4klVSBgSSLCsg70jQGionlnmjnMbtxbbvpH+77zE3OuJ5jVmO8Uyb+FcEdHvVRWQ8D897q0uru
	uA4q9wVnrkwXJ0mCes+WBXK0qhbmSbLlsY8ORLcjk2dGj51uyFsXcxBZsUrgg8qIwtp1MaP7iXFc4
	NgH6b6Np+Ec/2ggb7/wjEQME53tBt5rm436hZ7O3Eb56ZXrvUm+oo8bC/PWefMKO8IhbfY5hZ9T5i
	KbliSQZKS2jaVeMNyJpespxd0YYkuOwx56dPnO9PyU5U/xuLyuCBLrpNZ/CeL1W6eckx8aF7qVkAa
	4/NLQH4X9IYxE012Bmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIECm-00000002Gpt-0OLZ;
	Thu, 22 May 2025 22:16:00 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIECi-00000002GpH-43Sn
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 22:15:58 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-527b70bd90dso3114977e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 15:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747952155; x=1748556955; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMVPD+OZ4s7bW6e0XRDSTuuwdVn0ze69F4/9nj3q3/o=;
        b=XPsL+GXgZ8m9tEOion7e9oEMZZkmxix/R0oEbaR6ufWxcT0OZtUeLm6GvnkEQhO0bM
         M/I+TaT95ks+GF+JZqkIe+nrNOvROC31tl++hDJR22lfWAmElBUUyxvBkj0pHzpJ064M
         UJjywyoiBlKdRKnWt/BaAAfj/e5fwxOkYXI1e9Zxgn/7sozExFI2tPD5hBYSfKptVkRj
         kTlhdnpBTW9IKkMSyZrM1IL76VddWj7AzmacTyjPWJynd1Lmj4TeJZ4yn4TeTDTBsRzx
         7MgYgLvkvoKTV1lGxdk4Jq3qcKcPgzuvouSuNlbRPD5CE3OaW9RwmD6bt59PZ0Wn0EhS
         P5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952155; x=1748556955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMVPD+OZ4s7bW6e0XRDSTuuwdVn0ze69F4/9nj3q3/o=;
        b=mVdRrGNYL+bO7+pzyHD27zY1fc4i7IuxXnHUq9K0i+LP3X97PDccRqLUiRR05TbxDY
         KIZM0QBNRlY01sCpcB3m4lnXTOdaQMFNWE9ieTxrjo6rwloDCuB6k5RNOE5Ihnri54g2
         Gfi3PxRBEn8tva3ehE7GLiD7NXb67uafE4pd3D9ecO63tKXgkRQd+cVHzenQgiv0gwOG
         ZK+p0JldR0FB/rjk9eRF2XHv62olAeE025Qvhopy94gJKf9NW8ZYWO/rqb35lmC1zrCy
         jRL47UPe3+/Qevz5GU9ibKyXi9uozM9hjHzyyi2NPG0b0h/K3rZ+l7RjdZ1rA+z8fcev
         5DWg==
X-Gm-Message-State: AOJu0YxDbNsyxV7CdJdeJdwDa/bH65WHnocwf0WeyWK8b5didUtjPkqj
	HwNAu0dUStI8iGAfCOhVy/ZEVxJuOf8NxyniU6fmVZ+RWOX0F4hUxFfVJxufMI2CjzAVXV3QIq6
	x0x0rv4IMiXXBd1VMR2iWu9C0Ehr5xYxKKmn4ou1337Bv
X-Gm-Gg: ASbGncsEGqb5Sgnn7oq59GKuNLHL+CUQU8pgc6JtfysmnYVd5MdUYU+OjmOzgCyilDj
	210ydFdK6bIyo+0mhyH5i/t48zPUZJsROjZEu/SREwY9yNjSEUY/UWpiB9dFQHnC0Nn0uMRj2TR
	f7ems3G4jT8M6Frc9ZLvX+lnvhJFDlllBJhw==
X-Google-Smtp-Source: AGHT+IELKM+qJGk4ES+SzP+nMeVkDl1p/ATvfrdoyJX0Rrj5FYUfqh6gUJLEkF1LESGIA7CBZLzcWZJYbiLJSeeTdrI=
X-Received: by 2002:a05:6122:21a3:b0:52d:b855:e0b5 with SMTP id
 71dfb90a1353d-52f1fd00ae1mr774306e0c.3.1747952155267; Thu, 22 May 2025
 15:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
 <2f33a148-2a6d-4906-b2fc-6a8c853af3db@isrc.iscas.ac.cn>
In-Reply-To: <2f33a148-2a6d-4906-b2fc-6a8c853af3db@isrc.iscas.ac.cn>
From: Han Gao <rabenda.cn@gmail.com>
Date: Fri, 23 May 2025 06:15:43 +0800
X-Gm-Features: AX0GCFuthVeZjjuVfaYZWDOio-cbzgkI4-MTLHEvOEchzx8VHJF-GHdmQoeZq-A
Message-ID: <CAAT7Ki-0dNFU-DJNVg+kA19D29W25fiEVQcP6SakvgCUMhQz1Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, linux-kernel@vger.kernel.org, 
	Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_151557_006205_372B5432 
X-CRM114-Status: UNSURE (   6.90  )
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

U29ycnksIGZvcmdvdCB0byBhZGQgdGhlIGZpeCB0YWcKCkZpeGVzOiBkODYzOTEwZWFiYWYgKCJy
aXNjdjogdmVjdG9yOiBTdXBwb3J0IHh0aGVhZHZlY3RvciBzYXZlL3Jlc3RvcmUiKQoKT24gRnJp
LCBNYXkgMjMsIDIwMjUgYXQgMjoyOOKAr0FNIFhpb25nY2h1YW4gVGFuCjx0YW54aW9uZ2NodWFu
QGlzcmMuaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gSSB0ZXN0ZWQgdGhpcyBwYXRjaCB3aXRoIGxs
YW1hLmNwcCB3aGlsZSBhZGRpbmcgeHRoZWFkdmVjdG9yIHN1cHBvcnQuCj4gU3VycHJpc2luZ2x5
LCB0aGlzIGJ1ZyBkaWQgbm90IHByZXZlbnQgdGhlIExMTSBmcm9tIGdlbmVyYXRpbmcgcGxhdXNp
YmxlCj4gb3V0cHV0LCB0aG91Z2ggdGhlIG1vZGVsJ3MgcmVzcG9uc2VzIGJlY2FtZSBub3RpY2Vh
Ymx5IGxlc3MgY29oZXJlbnQuCj4KPiBUZXN0ZWQtYnk6IFhpb25nY2h1YW4gVGFuIDx0YW54aW9u
Z2NodWFuQGlzcmMuaXNjYXMuYWMuY24+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
