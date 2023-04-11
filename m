Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D96C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzctvAPqL0bFXdG1BE0fEVDpLCyueBhIDx67eUiTDxA=; b=v8or1cFLrKj+Cl
	PTD4gSIXcVxTmhGiOYhnV6QZW4/HM9aCrUI3DNpOp0y4QRvJQtruO5PIuGQScyThCPdlcH2Fmg7Ea
	jaIuviCB3915shc7TExmoSCOPmWnhEZsDILNmRo8vzCj9E/zaD3LsHnVKhaOzg0omPOHq69vVeRbI
	2zB4tcRbQJnvCufQBGDxZs7F234EYfx8S+vlnFAbSrno/g1c2V8xrG0WSENLuqmiWtib9d7rtvVmA
	SRsZ2YifN4ZiJkd/Ww6XAIWfgTm5RRluF1hJksYJ3hbq//PfY2xduaxfwFHfsnh1BnFRVaxvIs9Ir
	BUa75TD70sjHP3FKMrvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHxw-000jU6-0S;
	Tue, 11 Apr 2023 17:39:36 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHxt-000jTJ-1y
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 17:39:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1a64b65b2a0so4531465ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Apr 2023 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1681234771;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7pct+dMjqiVr0F6C0Ngb551md/gaAhmGoQbOMdY6l0=;
        b=VCnOKB7O+R3rx2QJgQk+H76PSX9UqiXTO19L4ieeibPM7fkJd6muBXdHWN8GaQcGfr
         0BjwL4NsGsQFHkT/CJZgfltdch5C47yw4K876P471CXwfRSj/00O6H61ZVxrmdpkRc5r
         4pYW/qNJUquMFVnrS2ZlraLQmSJ3h2XM7diaWmQy6wV3TYPPTQnDQ8hKqdc5lPrkYOm3
         TQKI0IxR6WeQM1lqxBUzRKMGYDd/PR7jaxvcFicisM7epKdXgmvyxN3gVHTnYji9enI7
         1uawsGcdwebp9Q0YDAbIIXtHR7u4AEJGvSnzqISlmOOfZ0BtaihjOzWyOuXtJXOE28is
         u9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681234771;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7pct+dMjqiVr0F6C0Ngb551md/gaAhmGoQbOMdY6l0=;
        b=pFfBZfvH/wjI2NFQzQqfcHVB1xulNVUz/I4igYzYGZbFGvs60JhmEq7VuSv4yXKk9S
         zrjxBny279rfA7MqY580UGSywUt15FwaECHNMfTDMixTUw6XtJvRy8Bi0+A8VciHcBY8
         B17F2+Tr5cvRidYyFQO5yEKZgOMnGNPPT3lzitmM2gyjJv/QN4wsirlRecOiSWXrV/cG
         J8QyXoxvUd/9k0aZ+ZohVNc4As5n0sflvzZE6G7/r7FBcy8A3yJX8dl+MqoRWPfRYFjY
         iEozdHBbwCzKX6paSfQ90iJnlEINouV536h3XBdxFs2h9YH/uU/UbmxPpNqMgubLWAx+
         uWVw==
X-Gm-Message-State: AAQBX9fu/gB5IJTuqx+se9yc8OK/VYivWEIXpmxMbseVpt8Loxf6ifrt
	efD2fWF23tYbJDuFbjG0TRNBHA==
X-Google-Smtp-Source: AKy350a0lBTG5rtlJI4P1dbKwIlPah2sQql23zMsXH7d1sea7rkk6PhXo9y8G6+MoHm7zs+V7yzF9Q==
X-Received: by 2002:a62:8492:0:b0:627:ea7a:ff46 with SMTP id k140-20020a628492000000b00627ea7aff46mr15278563pfd.16.1681234770885;
        Tue, 11 Apr 2023 10:39:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n4-20020aa78a44000000b006338e0a9728sm6432340pfa.109.2023.04.11.10.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 10:39:30 -0700 (PDT)
In-Reply-To: <20230403065207.1070974-1-bjorn@kernel.org>
References: <20230403065207.1070974-1-bjorn@kernel.org>
Subject: Re: [PATCH] riscv: entry: Save a0 prior
 syscall_enter_from_user_mode()
Message-Id: <168123475135.4147.9051999374596978440.b4-ty@rivosinc.com>
Date: Tue, 11 Apr 2023 10:39:11 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: =C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, iko_St=C3=BCbner?= <heiko@sntech.de>,
  Conor Dooley <conor@kernel.org>, Yipeng Zou <zouyipeng@huawei.com>, linux-kernel@vger.kernel.org,
  Heiko Stuebner <heiko.stuebner@vrull.eu>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
  =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_103933_874300_BCE62273 
X-CRM114-Status: UNSURE (   8.13  )
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

Ck9uIE1vbiwgMDMgQXByIDIwMjMgMDg6NTI6MDcgKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6
Cj4gVGhlIFJJU0MtViBjYWxsaW5nIGNvbnZlbnRpb24gcGFzc2VzIHRoZSBmaXJzdCBhcmd1bWVu
dCwgYW5kIHRoZQo+IHJldHVybiB2YWx1ZSBpbiB0aGUgYTAgcmVnaXN0ZXIuIEZvciB0aGlzIHJl
YXNvbiwgdGhlIGEwIHJlZ2lzdGVyCj4gbmVlZHMgc29tZSBleHRyYSBjYXJlOyBXaGVuIGhhbmRs
aW5nIHN5c2NhbGxzLCB0aGUgYTAgcmVnaXN0ZXIgaXMKPiBzYXZlZCBpbnRvIHJlZ3MtPm9yaWdf
YTAsIHNvIGEwIGNhbiBiZSBwcm9wZXJseSByZXN0b3JlZCBmb3IsCj4gZS5nLiBpbnRlcnJ1cHRl
ZCBzeXNjYWxscy4KPiAKPiBUaGlzIGZ1bmN0aW9uYWxpdHkgd2FzIGJyb2tlbiB3aXRoIHRoZSBp
bnRyb2R1Y3Rpb24gb2YgdGhlIGdlbmVyaWMKPiBlbnRyeSBwYXRjaGVzLiBIZXJlLCBhMCB3YXMg
c2F2ZWQgaW50byBvcmlnX2EwIGFmdGVyIGNhbGxpbmcKPiBzeXNjYWxsX2VudGVyX2Zyb21fdXNl
cl9tb2RlKCksIHdoaWNoIGNhbiBjaGFuZ2UgcmVncy0+YTAgZm9yIHNvbWUKPiBwYXRocywgaW5j
b3JyZWN0bHkgcmVzdG9yaW5nIGEwLgo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8x
XSByaXNjdjogZW50cnk6IFNhdmUgYTAgcHJpb3Igc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9k
ZSgpCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcGFsbWVyL2MvOWMyNTk4ZDQzNTEwCgpC
ZXN0IHJlZ2FyZHMsCi0tIApQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
