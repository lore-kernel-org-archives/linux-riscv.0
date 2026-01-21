Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6502C44500
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnuTjUzTgDPK4LTGcmPl/566UigSdiZH4ye5v25QIY8=; b=PCM+8T0qEfJ3g7
	3IKsothwHoiXbPI22A0mOJ/rViD8vHnGRc31oZdpknMa+tRz/HXvp5M8RTbBsbqWqvSiU2baoxQBx
	8BwHBKD4Cg/AEUmDbhJ1sR2yj/LYVrOydY6tmycGYZKKzZ/oVxympfYYIxmRrmKuG0iZrO6tULStZ
	XgAFZmqsQknr/tVo35fHfmDk4AlBhG8WwqTI5MSr06Zi/JrrJ5gXPnE1pE5et3NoVSlntF2MUsTWh
	3b8tBSIwExe1UvIfU4MWaATyqWLvj1tDnhl3SvI9VOF4vrOy8Mytrrkla/ZNAwErx0uNqwC2JTHue
	y5xMaDo+gq9+2wfWFkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifQV-000000063YI-2MyZ;
	Wed, 21 Jan 2026 21:07:43 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifQS-000000063Xw-37yc
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 21:07:41 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b872cf905d3so38776166b.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 13:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029659; cv=none;
        d=google.com; s=arc-20240605;
        b=PnOyXLMhmTQ0x6N0jpQ5akuy0qQ/o2MF+r+NYzzlFWbFrzBP+8RU7mEU9O7N3fTAzx
         jysnP9ilWlXkyo3ZoEXSFqWOg8WMxV1BgSHTYpvol4J7LGcwTk2kH/IUEN+l/Eg2XSnf
         YRiwmr86vxsI2QH0KD+aK1784Sy1MFHBlrYip16uwcliBqLaQ6laj8jNh5HnMSTzPMHL
         JQdZhxL86MXe+Tms9Fkr5TrS8/krn6bapImfljdFjaC2JZxfrYn8E19q6TByQdXpkVsg
         8Xzrlf5N1/RVC1xnudGE2uzeRSmtjUSYaGvBSji2dr1ot0EUZ9d6PgdYXHx9NmC4HfoC
         IaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mxbdV1l+x1SMIjb0JG/LXCMaDFsULIlcBtIAe2n/fh4=;
        fh=NztQwOsrgLpheifJXu9g3gX3cWtNo2EUaunTIGtSOxU=;
        b=O+KtwAyYZ1Kj0SEr/uk/hWVQQjQALOBZcdiChxt1dP0Oh1uwLGTJddkAJbAd+O3N+R
         yoUOM7zVr3x/yBu0VTQNDCS3Xt+IHV3+4ldnHTnvSkEvUjZPJonQD3acmAlegav15BG6
         B1UP1N2KB1nEiB3szaXp3RPv2EY5YyDVNqNnOmpiOiRD++KwYwSziH6SDcdQzWEontqI
         J09aaqQ9i8D43LRUfrAEDyo1wXMMVk4a8xeC8CTNHz3W28ZSk4i0vUk/AqbqnIGFGgfK
         qew5rd88soGrxPGrBCTGE3gJNmQm3FdftfnUjwBA5qRzA+E13EHs7SthOs6TGOWcIF2c
         TN3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769029659; x=1769634459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxbdV1l+x1SMIjb0JG/LXCMaDFsULIlcBtIAe2n/fh4=;
        b=kQ5uL2xLiCXTn5L0cd/JLUYYyVSotO9oCbEjb5x4IQR6CPXH9/8oS1dUFLVdWDZCIw
         bFOr4NZswu6rbOw5CPd7gBNLhld8vttdl5o55Wbi7RDFyuA5WiueI/u+TSaYo5s1CPvc
         +UKryEdT1KNnm+USRB4s41NvwDY4ILW3J33WSq2m6RuQI2vM7H0KvHp6m0hsjTWt64Mx
         mdaDhAsnihwGo8h9H6rqJGxuuEJq/PIqtgiwoQRYefmKvNJpCQDEAyVY7NWEWlMQaLd1
         glYM6nhF8dTDTYjoyclh3C3qrzmvPosGEhZnwsGmOsBa3QyOMH6Tq8nSPOA6txrSp41P
         pFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029659; x=1769634459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxbdV1l+x1SMIjb0JG/LXCMaDFsULIlcBtIAe2n/fh4=;
        b=kl3NYKiyG0LBQXnGxTIsHDlhAfP4xdmWRIp9rcet7hLfn26UAkTbtnWA6/c1u4lGlv
         syEWSbaKMecSVfnJcPQwXmNmj6OhMejH6wDC5FXF6LQ7TsOSj5+Dp0BaSvi9AONBpCbF
         Mjrdjce3hcHk5DAd7rSVl75lUvX6LDQcxPrKhRaXYdYoy3XINnKDEYQAMCEG/VO80fAJ
         n7Ht110FP01xFZU6+9NKMbLgUqfwVUsOVKrr+KIDQWfTM36kBIMbixW/zqBbSD79dwAk
         AD/LloVbgNYo+jmFagKx5DWpD8BdpR/A4IxpSpBnVbD+O2fX/wasAojSKFWiEKcreNIN
         iOoA==
X-Gm-Message-State: AOJu0YxfzxVkwswMOcrjL5F34q24X+o8n57ZiqW7Bl6qZT7XUVsRd+CL
	1M6LXD9fOXNbkBr2EUwfch/gw4xXPsYRICDIZ6BUZpvCpk5LYQlTQCEf8zbpG1RrwL5FlV0HQ+V
	YWZIASR0sw5zokxkYiMGfqQpuiWwvv9k=
X-Gm-Gg: AZuq6aIRf9pM1xmPHmlCda6FnxMM2ZpGEDB7Vow5B4/sbosxU9IJgVRSOHbuismlFHE
	p4dZlwcM1SkeXZkMKeWxbgjUObDzPsXMbmRB8YNrvLYwFdJ77c8UOIJVPpa5oVbzFRemIP4REXK
	wSEc4xSs0nvRQO0QC7mcKD6NtpuRCYIkfiewZf+GcDR5NCzrN3UZEZ/3DWbe6hRxXUWvVR7ZlDB
	/HdPnwvBwe2l/Mco5m7KI7m8/NPz1+QGRCEZVXCpAYkSuDPL0fEKTVVhrWKUPJLijYg
X-Received: by 2002:a17:907:2d9e:b0:b87:908:9aca with SMTP id
 a640c23a62f3a-b87968a9870mr1543554466b.9.1769029658501; Wed, 21 Jan 2026
 13:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-5-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-5-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:07:27 -0600
X-Gm-Features: AZwV_QjEhdRwi-DYL2mP1KM1r2r9z9nIROyn3jKd9PjJQxqbTAQQ7vnSVaOq26I
Message-ID: <CAFTtA3PPY-=bPJw1-iv56AQQ94saXZorC3rMM2Z4DwZJg4ruZg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] riscv: ptrace: validate input vector csr registers
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_130740_803207_92E77399 
X-CRM114-Status: GOOD (  10.61  )
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

SGkgU2VyZ2V5LAoKT24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0
eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc3RyaWN0IHZhbGlk
YXRpb24gZm9yIHZlY3RvciBjc3IgcmVnaXN0ZXJzIHdoZW4gc2V0dGluZyB0aGVtIHZpYQo+IHB0
cmFjZToKPiAtIHJlamVjdCBhdHRlbXB0cyB0byBzZXQgcmVzZXJ2ZWQgYml0cyBvciBpbnZhbGlk
IGZpZWxkIGNvbWJpbmF0aW9ucwo+IC0gZW5mb3JjZSBzdHJpY3QgVkwgY2hlY2tzIGFnYWluc3Qg
Y2FsY3VsYXRlZCBWTE1BWCB2YWx1ZXMKPgo+IFZlY3RvciBzcGVjcyAwLjcuMSBhbmQgMS4wIGFs
bG93IG5vcm1hbCBhcHBsaWNhdGlvbnMgdG8gc2V0IGNhbmRpZGF0ZQo+IFZMIHZhbHVlcyBhbmQg
cmVhZCBiYWNrIHRoZSBoYXJkd2FyZS1hZGp1c3RlZCByZXN1bHRzLCBzZWUgc2VjdGlvbiA2Cj4g
Zm9yIGRldGFpbHMuIERpc2FsbG93IHN1Y2ggZmxleGliaWxpdHkgaW4gdmVjdG9yIHB0cmFjZSBv
cGVyYXRpb25zCj4gYW5kIHN0cmljdGx5IGVuZm9yY2UgdmFsaWQgVkwgaW5wdXQuCj4KPiBUaGUg
dHJhY2VkIHByb2Nlc3MgbWF5IG5vdCB1cGRhdGUgaXRzIHNhdmVkIHZlY3RvciBjb250ZXh0IGlm
IG5vIHZlY3Rvcgo+IGluc3RydWN0aW9ucyBleGVjdXRlIGJldHdlZW4gYnJlYWtwb2ludHMuIFNv
IHRoZSBwdXJwb3NlIG9mIHRoZSBzdHJpY3QKPiBwdHJhY2UgYXBwcm9hY2ggaXMgdG8gbWFrZSBz
dXJlIHRoYXQgZGVidWdnZXJzIG1haW50YWluIGFuIGFjY3VyYXRlIHZpZXcKPiBvZiB0aGUgdHJh
Y2VlJ3MgdmVjdG9yIGNvbnRleHQgYWNyb3NzIG11bHRpcGxlIGhhbHQvcmVzdW1lIGRlYnVnIGN5
Y2xlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBNYXR5dWtldmljaCA8Z2VvbWF0c2lAZ21h
aWwuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwuY29tPgoKVGhh
bmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
