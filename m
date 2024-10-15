Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B55D20681
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 22:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHxSinbRFc2XPcRhGOzMvZrhrIAqdkI9LE3JUi4uP5M=; b=1Z0jxcaH5P2UAJ
	PBX3DZPb/bgOVBfGSVekUobHlgfaZAzjoKM2so3iyGrTqo1NoxKcStbJ1vO4nXqiAELslvkrbTulr
	moQNUiZAj2jV6RouVi82whRXutvEv3xeXG1TT5LIuK9xKJ2P4L1tjLljr/od821BaWgysLBKZ1mRG
	OwZxZPfpYJYaDCXNupkvySJASKbyX//UtIi+Np4M+8FSTW2an4zJ75WUDnyP+x4+ZOTcWUK9H93+n
	5H9MOZ24oO/Vt1gp7xR/GCzePVQb/F4IMSxF7PID6MZlgj0CkQxH1KNzg7NKrZrRgPf+4+eO1IM63
	DJrtfC56l5z+T5VvcJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pff-00000009kkh-0o1y;
	Tue, 15 Oct 2024 22:05:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pf3-00000009kfT-3Jtj
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 22:05:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so3366620f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 15:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1729029899; x=1729634699; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pkk12nfRRJgVGUWEMa5YLLUkxQaxe30MNbzyRFlwSEM=;
        b=aK3J04e4WkEJ+MLzzAxgh5MkiDk4jGAG7bBdUwZjvqvFjtcz2wDwq30JAM2dq0mn91
         E8pnSOHK0rDTIfK7RH+sz3D14ebib1V0Y8UP6W4Ay+ssHilA4d/eK1Ar5clkXGU15kPt
         CBZz5f8P/ApkqTZp+K3ICS0TwHU+cTteNPVGgWssyGziSElYgA7t5q1LKXWCVLvvcEDN
         HEgtwthIu6igfhA+SJyHajLzLsssgaOKS6fdY+Ao0Vu1hiuLlN30lJl2qG0b0uleA7GE
         IbG/fF9oyRJjWuwUVx6yOcMoeJO/477Fl9am4wY3GIazIAUFMZwJVy3tWoZtOAaycIuX
         GxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029899; x=1729634699;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkk12nfRRJgVGUWEMa5YLLUkxQaxe30MNbzyRFlwSEM=;
        b=tk8OeBvJnTi504KSZmIttHzZ7HDFuoYaA3n3LMkBre6nuHgR2/SOKmRmdDpD2bw+23
         O0Q06dUMFIpxxZKNQcWA6ngJmUrUCgsgMGzlKRFWUH+JXmBW091Jn1FWe3v5uxpjt+i9
         NrfNghMzhTi47Z3KnAZ3Y6qthDxZYhCkWzMR3LrwpsrtocHwzJPJkUsd50qVYd8VdrnV
         FYQTCd3/rj9vuEn7P3z9whyAFtfohMMg6QGe24G1azlDZpch+ifhjUcRnAe1BTsu0wTn
         NcH9JZ0P05dXlnLH49f6vul5F7kENxSJyjfbIKt2i7b3DMvwqL20Jao8QDnERSHYGRWo
         Z9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbF+TACzz0mTJMHeaM3Psrq6X/qFTFWUUvlZcWbFni3r4exFVNGDN4WwkNsewGAROPsr7S8dmWKSe0WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0xSQFfpsQt2gI42xYWvI/dGCFbcUVSAiS9CTEi7gtR6lQi9kY
	s9zWXNu1fw69I+PH2QMjDdE6QEFF4nyqMghD0mu+agp2Cjujwb6eXqkQnFRP+3A=
X-Google-Smtp-Source: AGHT+IF9x5wF1b+0KR/aLBuLslCfjie/2+kpmUaaubzh4LXZULAmGakNPlrriV3NAszZ91sIWuH2cQ==
X-Received: by 2002:a5d:574e:0:b0:37d:518f:995d with SMTP id ffacd0b85a97d-37d552d92c7mr10802530f8f.56.1729029899444;
        Tue, 15 Oct 2024 15:04:59 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf857fsm2622593f8f.74.2024.10.15.15.04.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:04:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH -fixes] riscv: Do not use fortify in early code
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20241009072749.45006-1-alexghiti@rivosinc.com>
Date: Tue, 15 Oct 2024 23:04:47 +0100
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>,
 stable@vger.kernel.org
Message-Id: <1CA19FB3-C1E3-4C2F-A4FB-05B69EC66D2F@jrtc27.com>
References: <20241009072749.45006-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_150501_866521_90F5AFCA 
X-CRM114-Status: GOOD (  15.87  )
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

T24gOSBPY3QgMjAyNCwgYXQgMDg6MjcsIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4gCj4gRWFybHkgY29kZSBkZXNpZ25hdGVzIHRoZSBjb2RlIGV4ZWN1
dGVkIHdoZW4gdGhlIE1NVSBpcyBub3QgeWV0IGVuYWJsZWQsCj4gYW5kIHRoaXMgY29tZXMgd2l0
aCBzb21lIGxpbWl0YXRpb25zIChzZWUKPiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvYm9vdC5y
c3QsIHNlY3Rpb24gIlByZS1NTVUgZXhlY3V0aW9uIikuCj4gCj4gRk9SVElGWV9TT1VSQ0UgbXVz
dCBiZSBkaXNhYmxlZCB0aGVuIHNpbmNlIGl0IGNhbiB0cmlnZ2VyIGtlcm5lbCBwYW5pY3MKPiBh
cyByZXBvcnRlZCBpbiBbMV0uCj4gCj4gUmVwb3J0ZWQtYnk6IEphc29uIE1vbnRsZW9uIDxqbW9u
dGxlb0ByZWRoYXQuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvQ0FKRF9iUEplczRRaG1YWTVmNjNHSFY5QjlIRmtTQ29hWmprLXFDVDJOR1M3UTlIT0Rn
QG1haWwuZ21haWwuY29tLyBbMV0KPiBGaXhlczogYTM1NzA3YzNkODUwICgicmlzY3Y6IGFkZCBt
ZW1vcnktdHlwZSBlcnJhdGEgZm9yIFQtSGVhZCIpCj4gRml4ZXM6IDI2ZTdhYWNiODNkZiAoInJp
c2N2OiBBbGxvdyB0byBkb3duZ3JhZGUgcGFnaW5nIG1vZGUgZnJvbSB0aGUgY29tbWFuZCBsaW5l
IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KCklzIHRoZSBwcm9ibGVtIGluIFsxXSBu
b3QganVzdCB0aGF0IHRoZSBlYXJseSBib290IHBhdGggdXNlcyBtZW1jcHkgb24KdGhlIHJlc3Vs
dCBvZiBBTFRfT0xEX1BUUiwgd2hpY2ggaXMgYSB3aWxkbHkgb3V0LW9mLWJvdW5kcyBwb2ludGVy
IGZyb20KdGhlIGNvbXBpbGVy4oCZcyBwZXJzcGVjdGl2ZT8gSWYgc28sIGl0IHdvdWxkIHNlZW0g
YmV0dGVyIHRvIHVzZQp1bnNhZmVfbWVtY3B5IGZvciB0aGF0IG9uZSBjYWxsIHNpdGUgcmF0aGVy
IHRoYW4gdXNlIHRoZSBiaWcKX19OT19GT1JUSUZZIGhhbW1lciwgc3VyZWx5PwoKUHJlc3VtYWJs
eSB0aGUgbm9uLWVhcmx5IHBhdGggaXMganVzdCBhcyBiYWQgdG8gdGhlIGNvbXBpbGVyLCBidXQg
d29ya3MKYmVjYXVzZSBwYXRjaF90ZXh0X25vc3luYyBpc27igJl0IGluc3RydW1lbnRlZCwgc28g
dGhhdCB3b3VsZCBqdXN0IGFsaWduCnRoZSB0d28uCgpHZXR0aW5nIHRoZSBpbXBsZW1lbnRhdGlv
biB0byBub3QgYmUgc2lsZW50IG9uIGZhaWx1cmUgZHVyaW5nIGVhcmx5CmJvb3Qgd291bGQgYWxz
byBiZSBhIGdvb2QgaWRlYSwgYnV0IGl04oCZcyBzdXJlbHkgYmV0dGVyIHRvIGhhdmUKRk9SVElG
WV9TT1VSQ0UgZW5hYmxlZCB3aXRoIG5vIG91dHB1dCBmb3IgcG9zaXRpdmVzIHRoYW4gZGlzYWJs
ZSB0aGUKY2hlY2tpbmcgaW4gdGhlIGZpcnN0IHBsYWNlIGFuZCByaXNrIHVuY2F1Z2h0IGNvcnJ1
cHRpb24uCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
