Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD0D6E2D1
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 17:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlnWbkYX0Pml+uJZpcF87r0K9+B8IJSVlex4FtkYwSg=; b=2j0IhKI6qwbza0
	3SrS5FmHJCbl5EYPnLm/rqfARJ5eEcymYcRb41PB2ZyqgatCPeFD6zVCczQB50rZujxpCW0cZRqIN
	wc7kR4V87EPCKec3OTQL8jfFeEVa4j3oATlFqJIH31ssXqgQs2HfdO7epToFDj7qbXhr6Mo6d0S9J
	J8BG7qg168+hcGh55ETbjh0mipHtxV3um69Zq1awGHGFbu3sF3JQ0u0t7B1BCq6g4jOdj5tAXHAIr
	ZwfvbCllVWsfJnw+SQFjoWgKyhh6R4tmES/o6MpXUCCl9z5PzNgqN+6micR/2Zpml7looU7JeCFRv
	URBzeogXpQGkjWmv8uNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8w-00000008wsx-3XJK;
	Thu, 18 Dec 2025 17:50:26 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8u-00000008wrj-20gk
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 17:50:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1385811a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 09:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080222; x=1766685022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=;
        b=kNkCl/1lDAqswu3TH+ZWM9eiZFseB0Q26AyeVtc1BCdNoYz4E6gROGxpNuCtxJFYGf
         9BS4p0N0BHb7Pft7SVc3/l6ZVGuRp/WMHmRo/sOa0dlQOD01oaQMz8ecaIzZZt60Vqg7
         s78RdFmsZMIJoQ6XsoZC62MFHyLXALguBSYRqrhNZ68sdOpARafscWVUMioVKXrbXR5z
         3/Pssfbr6E+t+qV8ZRJMLKYKBru6MsgZD8URSZm3v0eSblRB/7NQsGYBe4jdRZtqu1ZW
         UyD8NUKI7RGLykRCyzSa4Z3LPyzI0gko9llC862NG7o+nhk+7dxwz22VqJl0A3KFGjcs
         2Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080222; x=1766685022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=;
        b=Km738Iq8enBNWAKVNDpL06MstZ6Wf3xKhaJKXAUKFMZpAuZHnk3Q6jVfus7GoGIyjb
         x0cE7hcrYZu+/Zj8mnsfhzRfHVUHyOssYtu5wmKwOO6y2zmGGUvgtqrVUyF4eblLKolm
         EO7ghamMr4mxx0nledYUCXiQ18JurPpImJPtaLzP0dzl8TiTiQZgq28lXpnp79g98dVm
         fN+qd3HSsDNo1xzfa0zUaL++hPQ1DiyncewqzVWVrshHeYMqTtoyM6uzdhVbh3EnyI2/
         uw0yEqNKY8CD9jKtUTJj3ySMPF99oebRC/RKWuHwzm010xkhddmUvpfAD6fVwTyGx+VE
         XePA==
X-Forwarded-Encrypted: i=1; AJvYcCVNX9aBH1OfGxemqh2B6OE2SRPHQfLsXjBzfREwgOlT1dxmUwsq1W2HE/wE3ZIBj7ZfaauxK0xoOP/Jjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxPCn3IQTUHx82DTr63t4BG9DdtIu5kZGkFjYk2K4kxXHEjCMx
	5JJANotyWZPKjb4W7pl5ky5C3NUXUGtP8saHL2H3zHfccP7oGZ6L2i/QR5RgkGuBjLJzUc8lvxO
	wBzJMBAeX0rU+pVetKSMTneaZbscv4kmQCvUPLAJhow==
X-Gm-Gg: AY/fxX79t+Iwfxp90JwD2GTeJwTKPbhx0tj0fRzSGQ6n4bxFD8+ULtLq+3Jq2d3gcX+
	wmJFgIP9zA1RcIaptw7/XOqmNS1RtNSDMxvZQphfemwViywYlOTad61HRO04Haj6EWQ2Qf3TyYL
	EMj0f7ymu4R9u/du8VzbWvzCALtQSay95hvr8ylPjXuteOH8OZXDnfKf1VC3Xg95be78Yxi8GKg
	pHIoaPwBy4h8aaiVKea/Mt5s8mc/9B0lZiYCpfu0TSuoo+erC3ynDm6nAbfHNBtRv/G9/Wvfozn
	ij15GgZN6wdqNQeOGXWh7ytw
X-Google-Smtp-Source: AGHT+IENlmR0sc0Xb7DhLwn0Vq765F8OyXjE3fAqqAeGP9hcTJDm+HMWSnu0fNRLLx3SXw/1GBSLkwKC99ivJnubJVM=
X-Received: by 2002:a05:6402:34cf:b0:641:15d:6b97 with SMTP id
 4fb4d7f45d1cf-64b8e94713bmr224102a12.2.1766080222160; Thu, 18 Dec 2025
 09:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <20251219-pgtable_check_v18rebase-v18-2-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-2-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:49:45 -0500
X-Gm-Features: AQt7F2oazAcKk3yq-_8d8SYNXUmWrpPknuvuaCQSw2vGEhneFPgafk9uUlx-JHE
Message-ID: <CA+CK2bD2FdFdM+=tcvf6L2x-j=b4HnixUwf4irWp-eNwQUeFrg@mail.gmail.com>
Subject: Re: [PATCH v18 02/12] arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_095024_523506_044161F7 
X-CRM114-Status: UNSURE (   5.97  )
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

T24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgMTI6MTDigK9QTSBBbmRyZXcgRG9ubmVsbGFuIDxhamRA
bGludXguaWJtLmNvbT4gd3JvdGU6Cj4KPiBUbyBwcm92aWRlIHN1cHBvcnQgZm9yIHBhZ2UgdGFi
bGUgY2hlY2sgb24gcG93ZXJwYywgd2UgbmVlZCB0byByZWluc3RhdGUgdGhlCj4gYWRkcmVzcyBw
YXJhbWV0ZXIgaW4gc2V2ZXJhbCBmdW5jdGlvbnMsIGluY2x1ZGluZwo+IHBhZ2VfdGFibGVfY2hl
Y2tfe3B0ZSxwbWQscHVkfV9jbGVhcigpLgo+Cj4gSW4gcHJlcGFyYXRpb24gZm9yIHRoaXMsIGFk
ZCB0aGUgYWRkciBwYXJhbWV0ZXIgdG8gYXJtNjQncwo+IF9fcHRlcF9nZXRfYW5kX2NsZWFyX2Fu
eXN6KCkgYW5kIGNoYW5nZSBpdHMgY2FsbHNpdGVzIGFjY29yZGluZ2x5Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+CgpSZXZpZXdlZC1ieTog
UGFzaGEgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
