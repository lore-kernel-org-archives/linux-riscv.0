Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196E8C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4xoNw6Fb93yIDenD8RYXYkxz8sGZXPw3+ijexKMBtI=; b=AWx1FP+VOht00l
	hExglQrs8gTg+aOkk+aoZVm7dGnOtD8x0MDJFm4cCB5y2ESkCnzlZwwGPXDM7Ux2Phc2o3UHMjFeZ
	ygiyL97jDtuDxesKpOEe/ls/bf/RowOg6y9twC6p1la/M+EP3FtfV8QGrMIKlRRQ323vf5tlwK2J1
	IqHX8uqKmKzwtkMLp9tTg/Xmi5L1YCh52Kv0+mrChghhcfr2O2zzEsMTn60czvir95rjB+NBrhbd7
	cg2ublXZIJq9JR3t7MmvKGfE3sv5KBn0FDmZ3JgCVYrVtj4OLJjoASMFuGMWtEhDkEsLKwWHO/3wk
	5GUjrgxRdQMuuLEddudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvBU-00FTXQ-1n;
	Fri, 19 May 2023 08:09:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvBS-00FTWk-0N;
	Fri, 19 May 2023 08:09:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ae52ce3205so20396665ad.3;
        Fri, 19 May 2023 01:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483791; x=1687075791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFfvDsP1Pp4ougCeQR0lxQyoOnnXgdmQJ0jpJVRq650=;
        b=mZKyEbd2FwrmrGjcDUlov5PgReXqA95wKg7WVMytdTw3x1Hm97Ozy7fDGGF5lOQW/B
         UHzk9z/eHgd59LpEHrCBOjiekcCjIqIkpEjN6Ld6LQv144n3zYAOLzPbtqf6Wfpwrze9
         U2YYhITOjtqwZFp+dnfjzWkUGRTJyywhrooERY4rTkmXk1BeRvy9EyFaCo+fVj89/mJE
         UKQYA/Be04N8FV0jtmzK7s1FhQ/h6epij9/WNacbNjM5Q39UhxgxOAJsevkvXgHtedWA
         Sn480P/3Md/iagXiFDA6LZNqJ7saTYabvlSfYUhOLIRKz3yutdK5WHbjp1/gxB5F35wM
         dK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483791; x=1687075791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFfvDsP1Pp4ougCeQR0lxQyoOnnXgdmQJ0jpJVRq650=;
        b=emVnPhYSRbgGXxkvJUrKJcUTl39QKm6Uph50pjaSEdmFzRwsarfPne9zHs6+yt9dmn
         y88UJl2FomLGHI3ggaDQPRUSq8+HuB3ZnnwpGhF6YrlWJAW73VC+OASFuA0bdoRYW8s6
         Fm0i9JnrR2h7hpV32rJsIhtDo/gZu6YJMojNLUbyd0bhsK/nNLsmQkjAWOFlGX1d4Gwh
         5OyD/indyNV/3gSAZ0bga7eztSHez5+gAhlvfx/t9RC16UUm491/exgOM1QGbkDMvUSO
         1MhGRV0BGcUW4YgoFcSiLZmpRhxgrq8WxqUEqsjEKfe4rYjd/YVZo22r26m7rrn3y4nP
         fNXg==
X-Gm-Message-State: AC+VfDz2ZBHCOduYBt890/+3k1u5s1T3zAE/tGQgHgBmNU60YzxoRXfU
	46iYMWMeTKwPPOMBnnh0R/c=
X-Google-Smtp-Source: ACHHUZ4nqCkVmeN4mA+zGKJoBbXRsxdBZKDRrLPkqszJ5QyaxylLhYNjgRgML55fKiz4ClX0CsiQyw==
X-Received: by 2002:a17:903:11c9:b0:1ac:63ac:10a7 with SMTP id q9-20020a17090311c900b001ac63ac10a7mr1994932plh.68.1684483790607;
        Fri, 19 May 2023 01:09:50 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-39.three.co.id. [116.206.28.39])
        by smtp.gmail.com with ESMTPSA id t21-20020a63d255000000b0053071b00c49sm2516483pgi.23.2023.05.19.01.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 01:09:50 -0700 (PDT)
Message-ID: <b66104cf-9e70-0d9b-ccc3-4f1897c84720@gmail.com>
Date: Fri, 19 May 2023 15:09:43 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -next v20 24/26] riscv: Add documentation for Vector
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Evan Green <evan@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-25-andy.chiu@sifive.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230518161949.11203-25-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_010954_151765_8522D60B 
X-CRM114-Status: UNSURE (   8.20  )
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

T24gNS8xOC8yMyAyMzoxOSwgQW5keSBDaGl1IHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkIGEgYnJp
ZWYgZG9jdW1lbnRhdGlvbiBvZiB0aGUgdXNlcnNwYWNlIGludGVyZmFjZSBpbgo+IHJlZ2FyZCB0
byB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24uCj4gCgoiQWRkIGEgYnJpZWYgZG9jdW1lbnRh
dGlvbiAuLi4iCgo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4g
Q28tZGV2ZWxvcGVkLWJ5OiBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4KPiAtLS0K
PiBDaGFuZ2Vsb2cgdjIwOgo+ICAtIERyb3AgYml0LWZpZWxkIHJlcHJlc3NlbnRhdGlvbiBhbmQg
dHlwb3MgKEJqw7ZybikKPiAgLSBGaXggZG9jdW1lbnQgc3R5bGluZyAoQmFnYXMpCgpBbnl3YXks
IHRoYW5rcyBmb3IgYXBwbHlpbmcgbXkgZml4dXBzIQoKLS0gCkFuIG9sZCBtYW4gZG9sbC4uLiBq
dXN0IHdoYXQgSSBhbHdheXMgd2FudGVkISAtIENsYXJhCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
