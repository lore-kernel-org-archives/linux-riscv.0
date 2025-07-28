Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BDAC83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGZRNXrdNO7K2rcMQcgIBQ8HrX9T7WKvQmj5cKNImZI=; b=rds8L4dxPLWFXM
	VSENHEDm64/0kGfGjEkDB921cNR4NWAZ3h7elcUZqRsF7/ozAA4wJogbx/cfdDOokXaTxDW77QKjZ
	BqtHiDzInrCN7asht/q9Dsh8R01N04G5dwNHTc75N1d+VC92eJuGyWLFGwDSyKLzx+MSvuKmEDQ5b
	BPNXEwBNPyRk7qqNk7i0rmWz2XqdwOAuiSk5WIqHmrdIVbLq5OiYmniBydu+6jLW+i+lKLvymLGnH
	N5omDVxzI9RcagAwt1VHU2bg6HBBOrUCI5pTYSwgWku4inqy9W38VekwxFc20PFMn1ndsjlEqDzab
	BF2J6Y7bS4gdQJcdel3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRah-0000000F68P-1PvR;
	Mon, 28 Jul 2025 17:24:47 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR75-0000000F2Kz-1Z9w
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:54:12 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-879c737bcebso4402539f.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753721650; x=1754326450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH510oq+ddwKySjTSU7h7Mjv+8k1DlfRXXv65SCkRG8=;
        b=Bu2NJTm4QifZyPqYGHN5M5N8R5LVxVM4KoMPGH7FtvopghHueYN8tT+4qsPmJrhPc0
         LUwS441lz6r6WHMVL1vdsbdqybIfJiZplAG9qJLfmJ8EQfkHqdeV2RDSHKgoHJSnVHob
         hXon4JpZFYknUXGv2k8rT/5j61WsdHBptvWJMBa8COD44/ffOUNSmMJPd3LzwD6vY4/w
         5jTC/BdYEc4b0wiHO6bMzx0ClGNs9/aYA6MwcOedOCCafCP8gaKq2lGN3zoJUWUqU9Px
         9pP2oVfDRNb2hpCnJ4dM3RRDkW3SFuJhnzxP/Bhj5lR6oR5X+aawE84egi353Umx40Gk
         u/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721650; x=1754326450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH510oq+ddwKySjTSU7h7Mjv+8k1DlfRXXv65SCkRG8=;
        b=wXInjuVwQXtdv9gciVUi6iPUVl5HVItE6JGKgHh72D5ubu4/2dS1iPxqYxjN3V3st5
         M9pb51cPCsFksVOFjJmZR0FMEcniCvhph0vaSd2FHnTDPzCDv+xqv/nya0hPPfohgOH0
         kZ3J5YyUCUsbts5m7rE55D2Wz1FPk+jMNh252PZ0FXb/UY3P3CKP9hutfQaTr/5JAQgl
         2WO0uXvLlEomQVkZI7IMf+YprS4aDkmjbPHn7Uz1MQA/zvucNd6cI4tbNMmCtTbUTykb
         zq06RtnDiCs10W3D8oC+ZOs6Tm2EpcOiAL3ilvuHNbe52lY+fX/ZbMTZqfXIZW7p9XjS
         WG7w==
X-Forwarded-Encrypted: i=1; AJvYcCW2nTrRTJvKgaOgcDx1xlQEKHRXK3+HiP/MHBib6FWzZnBcLL37qrImW6PYRKGDBan0DXLtjy8TjI7HfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN/4BVEcyBmsTqU9ynDBU6E95B3333vwKAPEnQHqQaksT+L6Kn
	p+2CKhYT++P9b1xG74EhOnbFcL1J9LN6SDRIunt9mCsfYWBdyBEZ4rxUI75WulUFarZAd/BqlPp
	fZC4qah0mw67oPLmBqcVz89eJRgNTmMiXCoj/uV3EuQ==
X-Gm-Gg: ASbGncu8kurkbZFsVG4N8Uy8Wojw/eUh6yqYAJ+q2Z2JyRa51ELyEK0PPus3PTeYAu7
	E8G7XTj+/g0YnjyHs1QTv9YWJYYmHJOBgqL2FQb90bQLRgBrk+Nynh/qxpyq2ENlIgfZ8TvkTEZ
	SzaAaLhaHnjjEJ5epfnD6MkILThHZWuOrx/Efx+/0HmiyU/C7dzrmdhwUhMdS3W6z0ZUe7f+dAr
	Cd9Zwo=
X-Google-Smtp-Source: AGHT+IE+ydlz1plQs5mKi/9M5YsolsQYwMvbn08BrO7ssd3p+pPCWkkLDRp1BiPYqlxZY55TBMCm6/WMQ6hV8/3ATig=
X-Received: by 2002:a05:6e02:3389:b0:3e2:9f5c:520f with SMTP id
 e9e14a558f8ab-3e3e92d90f2mr5397125ab.3.1753721650328; Mon, 28 Jul 2025
 09:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
 <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
 <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com> <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
In-Reply-To: <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Jul 2025 22:23:57 +0530
X-Gm-Features: Ac12FXxqhCPoLRJ1O8eU-7ZYNbb9bkJ8jT__-z9EkgKxYTzx-2nDiU9AnbLeyyY
Message-ID: <CAAhSdy11ZTi60=sNXT+8VcA=NtNk_AQNWvPEUUh-ov_fnciH5Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_095411_416877_90F21B81 
X-CRM114-Status: GOOD (  14.30  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgMTA6MjDigK9QTSBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKPgo+IElsIGx1biAyOCBsdWcgMjAyNSwgMTg6MjEgQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IGhhIHNjcml0dG86Cj4gPgo+ID4gQ3VycmVu
dGx5LCB1c2Vyc3BhY2Ugb25seSBoYXMgYSB3YXkgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGVudGly
ZQo+ID4gU0JJIEZXRlQgZXh0ZW5zaW9uLiBXZSBkZWZpbml0ZWx5IG5lZWQgdG8gZXh0ZW5kIE9O
RV9SRUcKPiA+IGludGVyZmFjZSB0byBhbGxvdyB1c2Vyc3BhY2Ugc2F2ZS9yZXN0b3JlIFNCSSBG
V0ZUIHN0YXRlLiBJIGFtCj4gPiBzdXJlIHRoaXMgd2lsbCBoYXBwZW4gcHJldHR5IHNvb24gKHBy
b2JhYmx5IG5leHQgbWVyZ2Ugd2luZG93KS4KPiA+Cj4gPiBBdCB0aGUgbW9tZW50LCBJIGFtIG5v
dCBzdXJlIHdoZXRoZXIgdXNlcnNwYWNlIGFsc28gbmVlZHMgYQo+ID4gd2F5IHRvIGVuYWJsZS9k
aXNhYmxlIGluZGl2aWR1YWwgZmVhdHVyZXMgb2YgU0JJIEZXRlQgZXh0ZW5zaW9uLgo+ID4gV2hh
dCBkbyB5b3UgdGhpbmsgPwo+Cj4gWWVzLCB5b3UgZG8uIEZXRlQgZXh0ZW5zaW9ucyBhcmUgZXF1
aXZhbGVudCB0byBDUFUgZXh0ZW5zaW9ucy4gQnV0IGFsbAo+IHRoaXMgc2hvdWxkIGhhdmUgYmVl
biBkb25lIGJlZm9yZSBpbmNsdWRpbmcgQ2xlbWVudCdzIHdvcmsuIFdpdGhvdXQgaXQKPiB1c2Vy
c3BhY2UgaGFzIG5vIHdheSB0byBzdXBwb3J0IEZXRlQuCj4KPiBEcmV3LCBJIHNlZSB5b3UgaGF2
ZSBSZXZpZXdlZC1ieSBvbiB0aGUgcGF0Y2hlczsgcGxlYXNlIGtlZXAgYW4gZXllIG9uCj4gdGhp
cyBzdHVmZi4KPgo+IENhbiB5b3UgcmVzcGluIHdpdGggdGhlIGZpeCB0byB0aGUgU29CIGxpbmUg
YW5kIG5vIEZXRlQgc3VwcG9ydD8KClN1cmUsIEkgd2lsbCBzZW5kIHYyIFBSLgoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
