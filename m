Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46C6C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+lYy+8LxxfGooH6mJLlFRQ8iuUoemHJdG40ZRGoO0c=; b=ogqRyD0y9S9DBh
	dG2ihkXNPRUrnTH1OHqjGOxXxywWzJnEvSMTMuPlT9Rz1UVC5gw4rIFxKYTdfK3UAPc6mQnUzXdRW
	z2ATKym9EZPfwAMx5D8Zf6QNxFDe+paxfBn6DUizFZzvmfOmGuBiaPE7oYB4hnmU24t2Z3tsoAUTc
	v46t3peNS0wz+YewYREF2cF2+4mWHDqXAh/nS4BbMEZwYpsXTPJ3HlaZB/Q/x68is4zVc6t52wTZ2
	wMGxOoKjBqlX+BHGemuyC70CF2GyhYOT7moGa5VB9CYySJeXZPlkFQziW7L+Zvd/JhxoRG8ve3DA8
	879I9DoUQFZLSCSiTHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2ST-0000000GUSi-3C0w;
	Mon, 03 Feb 2025 19:50:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2SR-0000000GUSO-25VP
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Feb 2025 19:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yFHGqbxIEoUkwsAnPlyxex2jjkQB0xBfGkX7c+zLGSM=; b=KAa4nN+FmOlM7XkEq/1nxMHNm9
	uVwdXEqojYJEt/LnXNf0QgTRpoq0wOdksJ4cqU25bIRlev5To0n11P3kuU5p9MdvejAy0QCkxGdvz
	VQiPM3WJCqZEuP6r0sK7Lxd+5xRQQJpXckOo2eB2F1DNH8STQ+g2AMh4mgpiwTPhlSFo/yb9j0420
	I55PGc/AiqnjwVyUsn8lBD4hGpQ75uRlont9Dpkiqp/CwMmWGHlV1QYL/+sOsXpn/1wyrMWbiy/7c
	pAWjhGCF0Z3vPKjTn5PNW0WDhKMpFYBxxghRlvqt3ofGeYxcfQmfKxRk4hpN4LT4GY0hu8Slynj3o
	H/WYeMLA==;
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2SN-0000000G9g8-3s1i
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:50:10 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2167141dfa1so83926095ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 11:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738612205; x=1739217005; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yFHGqbxIEoUkwsAnPlyxex2jjkQB0xBfGkX7c+zLGSM=;
        b=VJJ29LvTcYJ5JcgA488Uo8Zl21mzEjRRGTvKE1ItAKuPEmVNpKE+F1aRaA5m/N0Y4F
         /jPvpvTERy2b+uScjv+SmQrardoDHSf/AJ42tiaa8pWEs1Mr0XYu0sObDRnuktzngiQz
         2yUqckmtj6D5bF2q/mFjkYNLNNAnN4QmfVekooH/ub9zDjbW2OsN8HgDP9/3YTh9IfWR
         u0b1/HJuxFuUymZcxnxsRFImM8Thb0c2qKSrLJmTM+8SQwOBZb+2cg0U5c2UxHmxXMEs
         v7ALR+P/Hi+GFHcOZNx6dghzmWACIo3Xb45bS8pJ1+lDNlriqSmX2tISsIA34Zizk3uA
         wIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738612205; x=1739217005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFHGqbxIEoUkwsAnPlyxex2jjkQB0xBfGkX7c+zLGSM=;
        b=Ii55wQdmCX0QWDkxlkJmI+bysNrQeMOf16PYlBXWp0pl/mu+UQVwq/8g9+/Eg+qzrB
         Oia4M6fFZ7ELGVh7T539hFYal6ec3l5KmaVRtD3IbLjLcrVmzv3zvARepp433IUJCWXD
         qMXJLiT34XvU4PeFZC4aXScAW80QjvLIDWSYgFfgDgyXfqK0FzOYPLDLzCXq1llNDK69
         kM1e3HfqVIcEVcT0G28XVwrpcDikKOEL9RKfLVbCh1R6uy6xU6jFNBXdgj9X8W4e6ydZ
         4AJjqVRrvOEHq4xSI3nqWi7aAGNeznDWonJrXiBh0ExMknM7Vy8l2DlYIzgn6Nnp2T4a
         atrA==
X-Forwarded-Encrypted: i=1; AJvYcCVXcateTDGusD9Odqg/oglHAeBZGnNMd0AFlOoYrBBAhQLG5ExVGKWhqoCYiySn+Ke1SqrOgOGJGUSc9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDGirjtjpHxq1j1B40Zna8/iPp5lnPT/07jLiu0OKpCiKmMIj1
	BEi3tWim/Vd8HveNWfQ4BiMEgD7YaGf1JHhGfVBs2gPKyHIsigmht3ODYhZsElE=
X-Gm-Gg: ASbGncu4r3QTdGgzlcqijKPAAa+DojXxrhboo8HezJd0FpK0M4ZPvKv8DkjkLm42wYA
	4zTSMMTkWluvw+7xf9vWLNvNXKHkSdlrrahThnbZlqFDrlzepY4h7dqlFLc/VyDE9cyRAPPUU+1
	0GB3paPPHYGbYrSO+d4j9CstK2fs/Rima2x5ZaN4wVFhqMktitkWpSmbfTQeYzLPicf36+fcmQA
	Kvw0EqO2TaqgpMiIQ9ciKIMC707tb5e9xSbV2dc8XXZWgPcXOIBb8GFSuxZ25IDbgq+jkZS6cwm
	BF4zWGBR434=
X-Google-Smtp-Source: AGHT+IEchQZJ+49I8J5Gk0AWuiHX7StzWjiS1tUolkAZSGk0Th2flkDcybEtCm4KVdc/Y9uGIZeKPQ==
X-Received: by 2002:a17:902:d50a:b0:215:9eac:1857 with SMTP id d9443c01a7336-21f01bfe998mr1628735ad.5.1738612205293;
        Mon, 03 Feb 2025 11:50:05 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f8344sm80007255ad.75.2025.02.03.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:50:04 -0800 (PST)
Date: Mon, 3 Feb 2025 11:50:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrea Parri <parri.andrea@gmail.com>,
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	Eric Chan <ericchancf@google.com>, linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
Message-ID: <Z6Ed6gYzdKhQQQVM@ghost>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud>
 <Z6EVIPc_t6zMU9qb@ghost>
 <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195008_180728_D01C2C80 
X-CRM114-Status: GOOD (  31.19  )
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

T24gTW9uLCBGZWIgMDMsIDIwMjUgYXQgMDE6MzA6NDhQTSAtMDYwMCwgU2FtdWVsIEhvbGxhbmQg
d3JvdGU6Cj4gSGkgQ2hhcmxpZSwKPiAKPiBPbiAyMDI1LTAyLTAzIDE6MTIgUE0sIENoYXJsaWUg
SmVua2lucyB3cm90ZToKPiA+IE9uIFN1biwgRmViIDAyLCAyMDI1IGF0IDA4OjA4OjUwUE0gKzAw
MDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+PiBPbiBTYXQsIEZlYiAwMSwgMjAyNSBhdCAwMTow
NDoyNVBNICswMTAwLCBBbGVrc2FuZGFyIFJpa2FsbyB3cm90ZToKPiA+Pj4gT24gRnJpLCBKYW4g
MTAsIDIwMjUgYXQgNDoyM+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+IHdyb3RlOgo+ID4+Pgo+ID4+Pj4+IEZyb206IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29t
Pgo+ID4+Pj4+Cj4gPj4+Pj4gVXNlIG9ubHkgTFIvU0MgaW5zdHJ1Y3Rpb25zIHRvIGltcGxlbWVu
dCBhdG9taWMgZnVuY3Rpb25zLgo+ID4+Pj4KPiA+Pj4+IEluIHRoZSBwcmV2aW91cyBwYXRjaCB5
b3UgbWVudGlvbiB0aGF0IHRoaXMgaXMgdG8gc3VwcG9ydCBNSVBTIFA4NzAwLiBDYW4KPiA+Pj4+
IHlvdSBleHBhbmQgb24gd2h5IHRoaXMgY2hhbmdlIGlzIHJlcXVpcmVkPyBUaGUgZGF0YXNoZWV0
IGF0IFsxXSBzYXlzOgo+ID4+Pj4KPiA+Pj4+ICJUaGUgUDg3MDAgY29yZSBpcyBjb25maWd1cmVk
IHRvIHN1cHBvcnQgdGhlIFJWNjRHQ1piYV9aYmIgKEcgPSBJTUFGRCkKPiA+Pj4+IFN0YW5kYXJk
IElTQS4gSXQgaW5jbHVkZXMgdGhlIFJWNjRJIGJhc2UgSVNBLCBNdWx0aXBseSAoTSksIEF0b21p
YyAoQSksCj4gPj4+PiBTaW5nbGUtUHJlY2lzaW9uIEZsb2F0aW5nIFBvaW50IChGKSwgRG91Ymxl
IChEKSwgQ29tcHJlc3NlZCAoQykgUklTQy1WCj4gPj4+PiBleHRlbnNpb25zLCBhcyB3ZWxsIGFz
IHRoZSBhcyB3ZWxsIGFzIHRoZSBiaXQtbWFuaXB1bGF0aW9uIGV4dGVuc2lvbnMKPiA+Pj4+ICha
YmEpIGFuZCAoWmJiKSIKPiA+Pj4+Cj4gPj4+PiBUaGUgIkEiIGV4dGVuc2lvbiBpcyBhIHBhcnQg
b2YgIkciIHdoaWNoIGlzIG1vc3RseSBhc3N1bWVkIHRvIGV4aXN0IGluCj4gPj4+PiB0aGUga2Vy
bmVsLiBBZGRpdGlvbmFsbHksIGhhdmluZyB0aGlzIGJlIGEgY29tcGlsYXRpb24gZmxhZyB3aWxs
IGNhdXNlCj4gPj4+PiB0cmFwcyBvbiBnZW5lcmljIGtlcm5lbHMuIFdlIGdlbmVyYWxseSB0cnkg
dG8gcHVzaCBldmVyeXRoaW5nIHdlIGNhbgo+ID4+Pj4gaW50byBydW50aW1lIGZlYXR1cmUgZGV0
ZWN0aW9uIHNpbmNlIHRoZXJlIGFyZSBzbyBtYW55IHBvc3NpYmxlIHZhcmlhbnRzCj4gPj4+PiBv
ZiByaXNjdi4KPiA+Pj4+Cj4gPj4+PiBFeHByZXNzaW5nIG5vdCBiZWluZyBhYmxlIHRvIHBlcmZv
cm0gYSBmZWF0dXJlIGxpa2UgdGhpcyBpcyBub3JtYWxseQo+ID4+Pj4gYmV0dGVyIGV4cHJlc3Nl
ZCBhcyBhbiBlcnJhdGEuIFRoZW4gZ2VuZXJpYyBrZXJuZWxzIHdpbGwgYmUgYWJsZSB0bwo+ID4+
Pj4gaW5jbHVkZSB0aGlzLCBhbmQgYW55Ym9keSB3aG8gZG9lc24ndCB3YW50IHRvIGhhdmUgdGhl
IGV4dHJhIG5vcHMKPiA+Pj4+IGludHJvZHVjZWQgY2FuIGRpc2FibGUgdGhlIGVycmF0YS4gQSBz
aW1pbGFyIGFwcHJvYWNoIHRvIHdoYXQgSSBwb2ludGVkCj4gPj4+PiBvdXQgbGFzdCB0aW1lIHNo
b3VsZCB3b3JrIGhlcmUgdG9vIChidXQgd2l0aCBtb3JlIHBsYWNlcyB0byByZXBsYWNlKQo+ID4+
Pj4gWzJdLgo+ID4+Pj4KPiA+Pj4+IFsxXSBodHRwczovL21pcHMuY29tL3dwLWNvbnRlbnQvdXBs
b2Fkcy8yMDI0LzExL1A4NzAwX0RhdGFfU2hlZXQucGRmCj4gPj4+PiBbMl0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC9aMi1VTmZ3Y0FRWVpxVkJVQGdob3N0L1QvCj4gPj4+Cj4gPj4+IFNv
IGZhciB3ZSBoYXZlbid0IGZvdW5kIGEgd2F5IHRvIGRvIHRoaXMgdXNpbmcgZXJyYXRhLgo+ID4+
Cj4gPj4gWW91IG1lYW4gdXNpbmcgYWx0ZXJuYXRpdmVzPyBOb3QgaW1wbGVtZW50aW5nIEEsIGJ1
dCBpbnN0ZWFkCj4gPj4gaW1wbGVtZW50aW5nIFphbHJzYywgaXMgbm90IGFuIGVycmF0dW0uIEl0
J3MgYSBkZXNpZ24gZGVjaXNpb24uCj4gPiAKPiA+IFdlIGNvdWxkIGRvIHRoZSBzYW1lIHRoaW5n
IHdlIGRvIHdpdGggbWlzYWxpZ25lZCBhY2Nlc3MgZGV0ZWN0aW9uIGFuZAo+ID4gcnVuIHNvbWUg
aW5zdHJ1Y3Rpb25zIHRvIGRldGVybWluZSBpZiB0aGVzZSBpbnN0cnVjdGlvbnMgYXJlIGJlaW5n
Cj4gPiBlbXVsYXRlZC4gIElmIHRoZXkgYXJlIGJlaW5nIGVtdWxhdGVkLCBwYXRjaCBhbGwgb2Yg
dGhlIHBsYWNlcyB0byB1c2UKPiA+IHphbHJzYy4KPiAKPiBJcyB0aGUgaW1wbGljYXRpb24gaGVy
ZSB0aGF0IHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucyBsaXN0IHBhc3NlZCB0byB0aGUga2VybmVs
Cj4gd2lsbCBjb250YWluICJhIiwgZXZlbiB0aG91Z2ggdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1
cHBvcnQgaXQsIGJlY2F1c2UgQU1PcyBhcmUKPiBlbXVsYXRlZCBpbiBNLW1vZGU/Cj4gCj4gSWYg
dGhhdCBpcyBub3QgdGhlIGNhc2UsIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHJ1bnRpbWUgZGV0ZWN0
aW9uLiBUaGUgYWx0ZXJuYXRpdmUKPiBlbnRyeSBjYW4gY2hlY2sgUklTQ1ZfSVNBX0VYVF9aQUFN
TyAod2hpY2ggd291bGQgYmUgaW1wbGllZCBieSBSSVNDVl9JU0FfRVhUX2EpCj4gaW4gdGhlIElT
QSBiaXRtYXAgbGlrZSBub3JtYWwuCgpUaGF0IHdvdWxkIGJlIG11Y2ggYmV0dGVyISBJIHdhcyB1
bmRlciB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSB1c2VjYXNlCmZvciB0aGlzIHBhdGNoIHdhcyB0
aGF0IHRoZXkgd2VyZSBwYXNzaW5nIGluICJhIiBhbmQgd2FudGluZyB0byBvbmx5IGdldAp6YWxy
c2MuIFdlIHNob3VsZCBiZSBhYmxlIHRvIGNoZWNrClJJU0NWX0lTQV9FWFRfWkFBTU8vUklTQ1Zf
SVNBX0VYVF9aQUxSU0MgdG8gZ2V0IHRoZSBpbmZvcm1hdGlvbiB3aXRob3V0CnJ1bnRpbWUgZGV0
ZWN0aW9uLgoKLSBDaGFybGllCgo+IAo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
