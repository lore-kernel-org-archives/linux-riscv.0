Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2C2C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZjl13h6Ny5nkN8DsQNOlSz59srth9yBjhmyFtMF3SA=; b=BdYF5DjvZxg6/2
	EYZmCiG9A3Kh75Ecg7pedXKcZXlTwh3MAShn8Nkso8nAFdRiaJQ8DUbTGHQcoLnlMl/f5idT50TEk
	6IbiTpfZJ7NgjMSEHB/dBH8RMCbSX1XDvcMiOyVwDqezIwjj/DT97N8AldLy1j5Wzl03eCLbilbFk
	SVHx16UlttToJFxM0PPzkT8Rlm8EmgS3oaextXVmMpGw0DwRin/s1S6tC9bpevZwntFZPOb9BAsJL
	426+/PJcoTZuD6es/jJSM7tY19Sn7GtmU0Ik/1zKEqT6mNJEjNZJls7fGePO1PyOly0B9tamiWLfw
	laeJwNxIC+Qs88HmUQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZnB-00000008NZJ-2LE3;
	Fri, 21 Jun 2024 08:38:45 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZn8-00000008NY2-3T5i
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 08:38:44 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-63186c222eeso16089357b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718959121; x=1719563921; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmuD9ij6chyK8MTqocqlyj2la/6Cg/k6crdy5De8/FI=;
        b=HJdRG8A47pydwyFyswZ+XzVXkpI361BS8Xo7quTHJJXyNXZEe5nqP2EveAkqY/yq01
         tHJ4EOWHrzB0x8jswH8iNPf0yhw5cKn1JrQ6XdXEa1mgGjfYZcba2Q8400ZlJ7K5tS3N
         NODaPu7RFcsgk9liEQkjTHRY0LiNEMXT3q8fGtlcLwi6cwVD1BTpuQE3jMBODoD2LV9Y
         ILJwOV7sdmbDDAwhH4is0fVSuhfgWpOuraytOgmw/yloWyh9u+8BGUZJRCrGb3EGFMr3
         /pZTLWG8jWC+VNBnTVkkq9/limupJye9S2sDY3stFZSjwGyaz2xKZ/XS5zCZ83j4b2jp
         +NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718959121; x=1719563921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmuD9ij6chyK8MTqocqlyj2la/6Cg/k6crdy5De8/FI=;
        b=gUftdcWu0/yA4/SHzS7CHSnmuRAEDpMmztrHI+64v8emtjoBpfjru7oXbz+YWa1YqA
         h9scl3Mbt1sQmvMmFH8BQ3zxyHnIKBlpH0eMNRZexpFubJlAZ5G///cnXPn9D1MIosdQ
         jWXSHGk/8XCBQXbJGqkW/wfBT1P0g5tKbAkQFgaY/xiUCAPhE5c2TFwxziso6MKVQl3l
         q7sqRqwNjvftPkKllC1tW7rmdDicZ8q48c0Qn8wx5/mo89l7xwfuxeZIinHSCxOLYu+z
         0ZJr+ZiDlFNUpcO4q+CLYTSWqfRvviFsEWvpWpoi5kbZPyxv4JrEF95mMb6xaB+yVx8D
         0QqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRFo0EMDLcMFr2Kxinf0j0iwlmitwTxH325QiHjIt+6D0CqcfnhH6CA5TiHtCMt5gXfdsVIj82sZnUs1Z8kfmPb9lG1+G/auquUovJ0vqW
X-Gm-Message-State: AOJu0YwsCGhNz7t/sbntXKZoKUWQzvm00TyCKSfJ7cC8Hn9deCCTuhBa
	HSleWffHCl7rV4qyWP6gg59kKH7CEjmee+lruP2WkLfUpCpvKsXC7hP1/m0x/N8Spoa5Hn26ePw
	taXkLLXBdo7xFSJSNBfFL2KzgwQ+GoMsZYl091biIl8XXvBbp
X-Google-Smtp-Source: AGHT+IF912ccGWjWI9KaFr/46jfr9YC6MYpl/J6B8gC/LJE0T8xr9OXEwfRFOQ4rmWJjIRKdkcAoXsOlgo0V93Pg20I=
X-Received: by 2002:a0d:eb01:0:b0:631:4e00:2c06 with SMTP id
 00721157ae682-63a8d82c7efmr80902067b3.2.1718959121093; Fri, 21 Jun 2024
 01:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
 <20240609-support_vendor_extensions-v2-4-9a43f1fdcbb9@rivosinc.com>
In-Reply-To: <20240609-support_vendor_extensions-v2-4-9a43f1fdcbb9@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 21 Jun 2024 16:38:30 +0800
Message-ID: <CABgGipWk=8v=bgZ0OaA=HSDrm2iX3qk6WQuBcqLCzTr_HVYANw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: cpufeature: Extract common elements from
 extension checking
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_013842_888815_E3B9B0DB 
X-CRM114-Status: UNSURE (   9.73  )
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

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMTI6MzTigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBfX3Jpc2N2X2hhc19leHRlbnNpb25fbGlr
ZWx5KCkgYW5kIF9fcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseSgpCj4gZnVuY3Rpb25zIGZy
b20gdGhlIHZlbmRvcl9leHRlbnNpb25zLmggY2FuIGJlIHVzZWQgdG8gc2ltcGxpZnkgdGhlCj4g
c3RhbmRhcmQgZXh0ZW5zaW9uIGNoZWNraW5nIGNvZGUgYXMgd2VsbC4gTWlncmF0ZSB0aG9zZSBm
dW5jdGlvbnMgdG8KPiBjcHVmZWF0dXJlLmggYW5kIHJlb3JnYW5pemUgdGhlIGNvZGUgaW4gdGhl
IGZpbGUgdG8gdXNlIHRoZSBmdW5jdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEpl
bmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5k
eS5jaGl1QHNpZml2ZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
