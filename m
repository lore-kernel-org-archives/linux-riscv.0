Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FE8C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tCAc1grY3nbrYUgy0pWpyc2fkYceQ4JCxJ5msYWh4o=; b=mfP0joEeBQtBuH
	/z1wC+pi7DFiiC3wzjET0J3umU+Ew/6cBu3gxFTHorsTobtK/NEkafHT5ptdXAJHJiNBP//FUQH3h
	VrpuIlvbDimmWoAbgGjOtE7JzDm8tUCQIannS4lD+2TYLnEhNTsZYaJyFFwN7K1F7Tr4tSPQs1CNO
	uVRfRfY58D8ZsgTb3przKHbGCzQUq3AK89/dI0JOThcdpN+ih70VAMQTNRENWGdUQCzpHriTHBvdi
	g+I8TmkMMPL57AGCCrht1sAC5Yur4Lcp/h8yQjsSH0B/WkwlmE3Lv7szrMZwPugKYlHHOHT9ewmiD
	QYMPiuwpd+GWL0eTlazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQrc-0000000GxvN-3Vf9;
	Mon, 10 Feb 2025 10:18:04 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQqa-0000000Gxdz-0zNG
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 10:17:01 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso13835495ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739182619; x=1739787419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFMz+9VKuJuGZcGbXnQ6WKPgF0I7Qo9bwYmFLPQ8IUs=;
        b=XkxpU1zjOaEdrxJJVaipeFdcKGsG3mig1aDM2Kfinu+kITlgAiwYAuBuOyGNxPZQuL
         5sNH98Y8u5AiRQqu0g4vBRlc4WgkA2BIXNF/lEDnk0nG/ZORMeDumWURugjYdFMH48to
         El//IDxC8TcZdEitFKs6kVWN7oEZa2M9YEALq+ymwgTwaZjMFrCbbroQQQi4nmRp2MzR
         eerJNwHz40NDbFDx37+7IXoMJHtA7/SWZ3SyH3Hin9fZO6F7sU0p1wpoMRjmf3nkmVeY
         iHKs1EWHaywRLerHXNywsd4w+SWw/4S0WdoXYGDt90+sJV0VKTGNk47KnBINnOpwIrFN
         tJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182619; x=1739787419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFMz+9VKuJuGZcGbXnQ6WKPgF0I7Qo9bwYmFLPQ8IUs=;
        b=VIsY3jdLEl6IeFyb+RkQe9Cg8IEZ+0RZ48HQIsmOrGq0O6m7MXM0JuhFnCYcbv7URH
         nlG2lZwyvIxn2Ha2CKZT/SOFTN7SneOI+Ndb1WeA0SwgN0LNiOpilVvDaM5zrXokss9P
         O5XrOpaqtKIa3mFFMVrmecFOuAkA/6tloK05Lruzw10OPr4fah/6abK1o5F1zmF0vRFC
         WSx6jAlcZNbFzwpx/fmeT5WwdabWtTwbvUkgmkixvIUfeXHTqqxD+pio8HjnpsRDp9ct
         oPNVmAaGNSvp3FHeQ2K36nNWtEsIRd9cQmaM9oKiXMX3U1DM4Z0mlEQGUsoLyDrsN5rV
         dbzw==
X-Forwarded-Encrypted: i=1; AJvYcCXvfG9ty/p+5lUdVDh/MJWoSW2fLVv2G0Gt5DMMYCzreNMWh7PTJiuR8jWldcCiiy3+x3CEpjKydpy83A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzXEu8wVvntNSEMhPKicdDeUIozMZ0sxcEbfQ3/auWWjPNTgIL
	xiNvb1TGTryz14YxbD0dhiWj/HGep3Ul5SGXAgs+3B+vSqv6FmUPrPpq/HUAGDsITHKbiOOt0Vn
	5iHdZjyNPKGfAdV6UrohtRNQKs/9Un4a1ThU53Q==
X-Gm-Gg: ASbGncsfCQSAfyARQCyA5OY+9Ck6pqdWgCgwCKa28Ok1zVBusitgpVPR9Mf4uAMke5g
	clHn2jkbREtzTgvbZWB95exSTkzFxbJBWqt7Nfdjr52ruLjTxA09+qgtD2fjnC9d420mTLL2N8A
	==
X-Google-Smtp-Source: AGHT+IFxYxBGv2hc6E/05sAPGOPtP7XZJl8fJ+FlUzG2ytj0GYtSGPTcL+8sNxd5gXx2/ibqUfGkmDqHQCJxB762kY0=
X-Received: by 2002:a05:6e02:20c8:b0:3d0:21aa:a752 with SMTP id
 e9e14a558f8ab-3d13dd2c035mr97333115ab.2.1739182618823; Mon, 10 Feb 2025
 02:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
In-Reply-To: <Z6ax7B45OsGerjfA@ghost>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 10 Feb 2025 15:46:46 +0530
X-Gm-Features: AWEUYZmcXbHoRjnlS1mRz_OY6nbz0LaCvsVhqJHN8CjPX3-8IfaSya5IaXEP0zU
Message-ID: <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table lookups
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_021700_546366_C1893548 
X-CRM114-Status: GOOD (  17.23  )
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

T24gU2F0LCBGZWIgOCwgMjAyNSBhdCA2OjUz4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEZlYiAwNywgMjAyNSBhdCAwNToxOTo0
N1BNICswMTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiBQcm9iaW5nIHVuYWxpZ25lZCBhY2Nl
c3NlcyBvbiBib290IGlzIHRpbWUgY29uc3VtaW5nLiBQcm92aWRlIGEKPiA+IGZ1bmN0aW9uIHdo
aWNoIHdpbGwgYmUgdXNlZCB0byBsb29rIHVwIHRoZSBhY2Nlc3MgdHlwZSBpbiBhIHRhYmxlCj4g
PiBieSBpZCByZWdpc3RlcnMuIFZlbmRvcnMgd2hpY2ggcHJvdmlkZSB0YWJsZSBlbnRyaWVzIGNh
biB0aGVuIHNraXAKPiA+IHRoZSBwcm9iaW5nLgo+Cj4gVGhlIGFjY2VzcyBjaGVja2VyIGluIG15
IGV4cGVyaWVuY2UgaXMgb25seSB0aW1lIGNvbnN1bWluZyBvbiBzbG93Cj4gaGFyZHdhcmUuIEhh
cmR3YXJlIHRoYXQgc3VwcG9ydHMgZmFzdCB1bmFsaWduZWQgYWNjZXNzZXMgaXNuJ3QgcmVhbGx5
Cj4gaW1wYWN0ZWQgYnkgdGhpcz8gQXZvaWRpbmcgYSBsaXN0IG9mIGhhcmR3YXJlIHRoYXQgaGFz
IHNsb3cvZmFzdAo+IHVuYWxpZ25lZCBhY2Nlc3NlcyBpbiB0aGUga2VybmVsIHdhcyB0aGUgbWFp
biByZWFzb24gZm9yIGR5bmFtaWNhbGx5Cj4gY2hlY2tpbmcuIFdlIGRpZCBpbnRyb2R1Y2UgdGhl
IGNvbmZpZyBvcHRpb24gdG8gY29tcGlsZSB0aGUga2VybmVsIHdpdGgKPiBhc3N1bWVkIHNsb3cv
ZmFzdCBhY2Nlc3Nlcywgd2hpY2ggb2YgY291cnNlIGhhcyB0aGUgZG93bnNpZGUgb2YKPiByZWNv
bXBpbGluZyB0aGUga2VybmVsIGFuZCBJIGFzc3VtZSB0aGF0IHlvdSBhbHJlYWR5IGNvbnNpZGVy
ZWQgdGhhdC4KClRoZSBrY29uZmlnIG9wdGlvbiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZSB2aXNp
b24gb2YgcnVubmluZyB0aGUgc2FtZQprZXJuZWwgaW1hZ2UgYWNyb3NzIHBsYXRmb3Jtcy4KCj4K
PiBJbnN0ZWFkIG9mIGhhdmluZyBhIHRhYmxlIGluIHRoZSBrZXJuZWwsIHNvbWV0aGluZyB0aGF0
IHdvdWxkIGJlIG1vcmUKPiBwbGF0Zm9ybSBhZ25vc3RpYyB3b3VsZCBiZSB0byBoYXZlIGFuIGV4
dGVuc2lvbiB0aGF0IHNpZ25hbHMgdGhpcwo+IGluZm9ybWF0aW9uLiBUaGF0IHNlZW1zIGxpa2Ug
aXQgd291bGQgYWNjb21wbGlzaCB0aGUgc2FtZSBnb2FsIGFuZAo+IGxldmVyYWdlIHRoZSBleGlz
dGluZyBpbmZyYXN0cnVjdHVyZSBpbiB0aGUga2VybmVsLCBhbGJlaXQgd2l0aCB0aGUgbmVlZAo+
IHRvIG1ha2UgYSBuZXcgZXh0ZW5zaW9uLgo+CgpJTU8sIGV4cGVjdGluZyBhbiBJU0EgZXh0ZW5z
aW9uIHRvIGJlIGRlZmluZWQgZm9yIGFsbCBwb3NzaWJsZQptaWNyb2FyY2hpdGVjdHVyYWwgY2hv
aWNlcyBpcyBub3QgZ29pbmcgdG8gc2NhbGUgc28gaXQgaXMgYmV0dGVyCnRvIGhhdmUgaW5mcmFz
dHJ1Y3R1cmUgaW4ga2VybmVsIGl0c2VsZiB0byBpbmZlciBtaWNyb2FyY2hpdGVjdHVyYWwKY2hv
aWNlcyBiYXNlZCBvbiBSSVNDLVYgaW1wbGVtZW50YXRpb24gSUQuCgpSZWdhcmRzLApBbnVwCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
