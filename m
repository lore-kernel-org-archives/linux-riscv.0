Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44816C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 19:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B2E20827
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 19:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+a0L9MI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P87byO+m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15B2E20827
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pb96Sgr0fdM7B8lEeUz+l+fUcMwhGcI+QrlJ64jN0zU=; b=s+a0L9MIR0FNzv
	Jri0TcDKXegMD9LjwNMXagLPoKlui4FQ6WUO+/XFdotIqXzOXOdaa7Cy2Q1K2tcheOL+o3soRnBXL
	MB12nQgcD7FB+7ATHf+Zcyo1uT1K2HrzI2FYpF7KGgEzwiyiwG865mum4cU7BldoJuXm59gh/kby4
	rbJG5EcETV7zLN+Joze+sf0hFfo05+TzQ7o2AoyUKiykzyYqIcqd69WCpTHSe0RKB3SCUoxpLO0o6
	4B8OtZLvWYHKy41YbwzWMsAHg6PXBi6gkuw+kqYbuKP5UGR1D1pOxTm8VOt0MNb3biihIOMrrP4sN
	mQB43aVBQ9AgklVbxOpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKTlW-0002Vo-9o; Wed, 07 Nov 2018 19:45:26 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKTlM-0001lp-Pg; Wed, 07 Nov 2018 19:45:18 +0000
Received: by mail-qk1-x730.google.com with SMTP id a132so22623977qkg.1;
 Wed, 07 Nov 2018 11:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SGVh1pRpqxTDJUil1PaJY2qjRkU65DCtN64z6kLuIws=;
 b=P87byO+m9jareZqeHanIfDsaL4RTnXQPC+pKn68FyBiLJuUOq3Bvznoj2vw+dh8KUL
 xEhEb2GP3pg+cT3mYzDLdlvXKYDhdxO+L6Pz3Ii46AVkNtU4cGhEYsNeP/dukk6o9W8E
 rj03aGogeh6E0cQvG7474iza601VozTlqscPJk8f0x4Y/OgkqJA5XuKIsrQmwypafB4D
 j7vtEwHNyGDfNJJXJjXAq59LZi7SSkLGiQMnxqkWBOM4GxGiblpUBDHUc+Q3/MeYr//R
 gx9tGra+F6mRLuWNTazJJ+Nb1fuyPzFwxRvzmoogaT1Qn3G9+Ib5WRtSspRssUhvohKA
 sYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SGVh1pRpqxTDJUil1PaJY2qjRkU65DCtN64z6kLuIws=;
 b=gbiV4sSYrn/9bAmQpFgr+flpBBDexqsyC4/ptTxJphdtnZZvQOig/EOVJB6LX2FjbS
 jdpmqDYVd+xHR+5xXz21MI7xaGcn1tYOEg4v2SmLJ0RT+S5FeV0UtZxQ7P/EEopWPI/H
 C/5YgcxC5yFjWzKtPR713IJEgsyOyNVC+BIPHHWJfHBwLRDDAPbePborJGFLc9J4cSYD
 /+0Os3XmqCAGMzAD6evN+xVoaC6WC5fcjwEplgUO4RCDUtSVfMSQyQnW61Z0jkWWwRjF
 WTVKkJpAPVZRMawvCFmtzvrhL6aMtVxHTJQB8HCuPuj4x3TiJREQT9+PnScDDD32uBG4
 45eQ==
X-Gm-Message-State: AGRZ1gIShQ0Nj9zmhqadxAHBM8LselmLOPXYllyvBNJVdwkgORWE2DLK
 Jz2HY2Zc1nGn5ngHhNIutqIGOjR23qNaJ1mKIg==
X-Google-Smtp-Source: AJdET5e+boVKTDngrVwcjXovI+II2oq+n4LGZbqpXn80PMjxFA3CdYwLqP0wCvJ5HS2QV9gHRhVXTv+dJHk3+GdpWFI=
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr1483539qkg.184.1541619904850; 
 Wed, 07 Nov 2018 11:45:04 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
In-Reply-To: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
From: Rob Herring <robherring2@gmail.com>
Date: Wed, 7 Nov 2018 13:44:53 -0600
Message-ID:
 <CAL_Jsq+4d-0_T68r=PWm5ey=NqsCn5j_j1sQ4Kjp1zBz6zgt6A@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] SoC maintainer group
To: Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_114516_835916_F84C685E 
X-CRM114-Status: GOOD (  28.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Russell King <rmk@armlinux.org.uk>,
 ksummit-discuss@lists.linuxfoundation.org, Kevin Hilman <khilman@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107194453.78LD388EI4fHVuhz7Lhy-s8Tf8BEQEfZ_MPYIXb-JOA@z>

T24gVHVlLCBOb3YgNiwgMjAxOCBhdCA0OjE3IFBNIE9sb2YgSm9oYW5zc29uIDxvbG9mQGxpeG9t
Lm5ldD4gd3JvdGU6Cj4KPiBIaSBLUyBvcmdhbml6ZXJzIChhbmQgb3RoZXJzKSwKPgo+IFRoaXMg
aXMgYSBsYXRlIHRvcGljIHByb3Bvc2FsLCBob3BlZnVsbHkgdGhlcmUgaXMgc3RpbGwgdGltZSBv
biB0aGUgYWdlbmRhLgo+Cj4gV2XigJl2ZSByZWNlbnRseSBiZWVuIGRpc2N1c3Npbmcgc29tZSBt
YWludGFpbmVyIG1vZGVsIGNoYW5nZXMgYXMKPiBkZXNjcmliZWQgYmVsb3csIGFuZCB3b3VsZCBs
aWtlIGEgc2xvdCB0byBkaXNjdXNzIHRoZSBpZGVhIGFuZCBzb2xpY2l0Cj4gZmVlZGJhY2svY29t
bWVudHMgZnJvbSB0aGUgb3RoZXJzIHRoZXJlLgo+Cj4KPiBUaGlzIHN0YXJ0ZWQgd2l0aCBBcm5k
IGFuZCBJIGZpbmFsbHkgYmVpbmcgaW4gb25lIHBsYWNlIGF0IHRoZSBzYW1lCj4gdGltZSwgYW5k
IHRhbGtpbmcgYWJvdXQgaG93IHdlIHdhbnQgdG8gZXZvbHZlIGFybS1zb2MgbWFpbnRhaW5lcnNo
aXAKPiBtb3ZpbmcgZm9yd2FyZC4gV2UndmUgYmVlbiBpbmRlcGVuZGVudGx5IHRoaW5raW5nIG9m
IHdheXMgdG8gZXhwYW5kCj4gdGhlIGdyb3VwIGFuZCBtYWtpbmcgaXQgbW9yZSBzZWxmLXNlcnZp
Y2UgZm9yIGV2ZXJ5Ym9keSwgYnV0IHRoZXJlJ3MgYQo+IGJ1bmNoIG9mIHRvb2xpbmcgbmVlZGVk
IHRvIG1ha2UgaXQgcnVuIHNtb290aGx5IGJleW9uZCB0aGUgc21hbGxlcgo+IGdyb3VwIHdlIGhh
dmUgbm93Lgo+Cj4gSW4gdGhlIGVuZCwgd2UgZW5kZWQgdXAgbG9va2luZyBhdCBpdCBmcm9tIGEg
c2xpZ2h0bHkgZGlmZmVyZW50IGFuZ2xlOgo+IFJpZ2h0IG5vdywgd2hlbiBjb250cmlidXRvcnMg
c2hvdyB1cCB3aXRoIG5ldyBwbGF0Zm9ybSBzdXBwb3J0LCB0aGUKPiBmaXJzdCBoaWxsIHRoZXkg
bmVlZCB0byBjbGltYiBpcyBmaWd1cmluZyBvdXQgaG93IHRoZXkgbmVlZCB0byBjYXJ2ZQo+IHVw
IHRoZWlyIHBsYXRmb3JtIGFtb25nIGFsbCB0aGUgdmFyaW91cyBtYWludGFpbmVycywgaG93IHRv
IG1ha2Ugc3VyZQo+IHRoZXkncmUgYWxsIGhhbmRzaGFraW5nIG9uIGtlZXBpbmcgdGhpbmdzIHN0
YWJsZSwgYW5kIGdldCBjb2RlCj4gc3VibWl0dGVkLiBJdCdzIGF3a3dhcmQsIG5vdCB3ZWxsIGRv
Y3VtZW50ZWQgYW5kIG9uZSBvZiB0aGUgYmlnZ2VzdAo+IG92ZXJoZWFkcyB3ZSBoYXZlIG9uIG91
ciBzaWRlIGFzIHdlbGwuCj4KPiBXaGVuIHdlIHN0YXJ0ZWQgdGFsa2luZyB0byBvdGhlciBtYWlu
dGFpbmVycywgd2UncmUgYWxzbyByZWFsaXppbmcKPiB0aGF0IHdlIGFyZSBjdXJyZW50bHkgZHVw
bGljYXRpbmcgYSBsb3Qgb2Ygd29yay4gSW4gcGFydGljdWxhciwgd2UKPiBvZnRlbiBhbGwgZ2V0
IGNjOmQgb24gcGF0Y2ggc2VyaWVzLCBzbyB3ZSBhbGwgbmVlZCB0byByZWFkIGFuZCBmaWx0ZXIs
Cj4gYW5kIGFzc3VtZSB0aGF0IG90aGVyIG1haW50YWluZXJzIHNwb3QgdGhlIHJpZ2h0IHBhdGNo
ZXMsIGV0Yy4KPgo+IFdlIGhhdmUgZGlzY3Vzc2VkIGEgZmV3IGRpZmZlcmVudCBvcHRpb25zLCBh
bmQgaXQgc2VlbXMgbGlrZSBwb29saW5nCj4gbW9yZSBvZiB0aGUgY29udHJpYnV0aW9uIGZsb3cg
dG8gYSBncm91cCBvZiBjby1tYWludGFpbmVycyBpcyBhIHVzZWZ1bAo+IGFwcHJvYWNoLiBJbml0
aWFsbHksIHdlJ3JlIGNvbnNpZGVyaW5nIHRoZSBhcm0tc29jIHBsYXRmb3JtcywgY2xvY2sKPiBk
cml2ZXJzIGFuZCBwaW5jdHJsIGRyaXZlcnMsIHdoaWNoIGFsbCB0ZW5kIHRvIGJlIGFmZmVjdGVk
IGJ5IG5ldwo+IHBsYXRmb3JtIGNvbnRyaWJ1dGlvbnMgaW4gdGhpcyB3YXksIGFuZCBvZnRlbiBl
bmQgdXAgY3Jvc3MtY2M6ZCBvbgo+IGV2ZXJ5dGhpbmcuIEFkZGl0aW9uYWxseSwgdGhlIGZsb3cg
Zm9yIHN1Y2Nlc3NmdWxseSBtZXJnaW5nIGEgbmV3Cj4gcGxhdGZvcm0gb3IgU29DIG5lZWRzIHRv
IGJlIGRvY3VtZW50ZWQgYW5kIGFkdmVydGlzZWQuIFRoaXMgaXMgdHJ1ZQo+IHdoZXRoZXIgb3Ig
bm90IHdlIGNoYW5nZSB0aGUgd2F5IHRoYXQgbWFpbnRhaW5lcnMgY29vcmRpbmF0ZSBhbW9uZ3N0
Cj4gdGhlbXNlbHZlcywgb3Igd2hldGhlciBvciBub3Qgd2UgY2hhbmdlIHRoZSBjdXJyZW50IHdv
cmtmbG93IHVzZWQgYnkKPiBwbGF0Zm9ybSBjb250cmlidXRvcnMgdG9kYXkuCj4KPiBTbywgd2Un
cmUgcGxhbm5pbmcgdG8gY2hhbmdlIHRoaW5ncyB1cCBhIGJpdC4gV2UncmUgc3RhcnRpbmcgYSBu
ZXcKPiBncm91cCB0aGF0IHBvb2xzIGN1cnJlbnQgYXJtLXNvYywgY2xrIGFuZCBwaW5jdHJsIGRy
aXZlcnMgYW5kCj4gbWFpbnRhaW5lcnMgaW50byBvbmUgZnVubmVsLiBXZSdsbCBzZXQgdXAgYSBu
ZXcgbWFpbCBhbGlhcyBmb3IgdGhlCj4gbWFpbnRhaW5lciBncm91cCwgYW5kIG9uZSBzaGFyZWQg
cGF0Y2h3b3JrIHRvIGNvbGxlY3QgY29udHJpYnV0aW9ucy4KPiBXZSBzdGlsbCBleHBlY3QgZGV2
ZWxvcGVycyB0byB1c2UgZXhpc3RpbmcgbWFpbGluZyBsaXN0cywgYW5kIHdlIHN0aWxsCj4gZXhw
ZWN0IGZvciBleGFtcGxlIEFSTSBwbGF0Zm9ybSBtYWludGFpbmVycyB0byBrZWVwIHRoZWlyIHdv
cmtmbG93IG9mCj4gY29sbGVjdGluZyBwYXRjaGVzIGZvciB0aGVpciBwbGF0Zm9ybSBsaWtlIHRo
ZXkgZG8gdG9kYXkuIERvd24gdGhlCj4gcm9hZCBpdCBtaWdodCBtYWtlIHNlbnNlIHRvIGluY29y
cG9yYXRlIG90aGVyIGRyaXZlciBzdWJzeXN0ZW1zIGFzCj4gd2VsbC4KCkdpdmVuIHRoYXQgZHRz
IGZpbGVzIGFyZSBhIGxhcmdlIHBhcnQgb2Ygd2hhdCBnb2VzIGludG8gYXJtLXNvYywgYW55CnRo
b3VnaHRzIG9uIGNoYW5nZXMgdG8gdGhlIHByb2Nlc3MgYXJvdW5kIHRoZW0/IEkgdGhpbmsgaXQg
d291bGQgYmUKZ29vZCBpZiBkdHMgZmlsZXMgd2VyZSBhIGJpdCBtb3JlIGRlY291cGxlZCBmcm9t
IGtlcm5lbCBjb2RlIGNoYW5nZXMuClllcywgdGhlcmUncyB0aGUgaXNzdWUgd2l0aCBoZWFkZXIg
ZGVwZW5kZW5jaWVzIHRvIGRlYWwgd2l0aC4gSWdub3JpbmcKdGhhdCBmb3IgYSBtb21lbnQsIGtl
ZXBpbmcgdGhlIGR0cyBmaWxlcyBzb21ld2hhdCBzZXBhcmF0ZSBldmVuIGlmCnVsdGltYXRlbHkg
aW4gdGhlIHNhbWUgdHJlZSBhbmQgdGhlIHNhbWUgbWFpbnRhaW5lcnMgd291bGQgYmUKYmVuZWZp
Y2lhbCBib3RoIGZvciBwZXJjZXB0aW9uIGFuZCB0byBiZSBhYmxlIHRvIGRvIHZhbGlkYXRpb24K
c2VwYXJhdGVseS4gQW5kIGlmIHdlIGRvIGV2ZXIgbW92ZSB0aGluZ3Mgb3V0IG9mIHRoZSBrZXJu
ZWwgdHJlZSwgdGhlbgppdCdzIGxlc3Mgb2YgYSB3b3JrLWZsb3cgY2hhbmdlLiBBbmQgSSdtIGhh
cHB5IHRvIGhlbHAgb3V0IGhlcmUgaW4Kd2hhdGV2ZXIgd2F5IEkgY2FuLgoKPiBCZXlvbmQgdGhp
cywgd2UncmUgZ29pbmcgdG8ga2VlcCBhIGNsb3NlIGV5ZSBvbiB0aGUgZHJtLW1pc2MgdHJlZSwK
PiB3aGljaCBpcyBleHBsb3JpbmcgYSBtb3ZlIHRvIGdpdGxhYiAoYW5kIHdvcmtpbmcgd2l0aCBn
aXRsYWIgb24gYWRkaW5nCj4gdGhlIGZlYXR1cmVzIHRoZXkgbmVlZCB0byBtb3ZlIG92ZXIpLiBJ
ZiB0aGV5IGdldCBhIGJyb2FkIG1haW50YWluZXIKPiBtb2RlbCB3b3JraW5nIHdlbGwgaW4gdGhh
dCBlbnZpcm9ubWVudCBpdCBjb3VsZCBiZSBzb21ldGhpbmcgd2UgcmV1c2UKPiBmb3Igb3Vyc2Vs
dmVzIHRvby4KCkFJVUkgZm9yIGRybS1taXNjLCBhIG1ham9yIGdvYWwgdGhlcmUgaXMgdG8gaGF2
ZSBtb3JlIGF1dG9tYXRlZCBjaGVja3MKZmVkIGJhY2sgdG8gc3VibWl0dGVycyB3aGljaCBkb2Vz
bid0IG5lY2Vzc2FyaWx5IGhhdmUgYW55dGhpbmcgdG8gZG8Kd2l0aCBtYWludGFpbmVycy4gVGhh
dCdzIHNvbWV0aGluZyBJIHdhbnQgdG8gZ2V0IGluIGZyb250IG9mIGZvciBEVApzY2hlbWEgc28g
d2UncmUgbm90IGZpeGluZyB0aGluZ3MgYWZ0ZXIgd2UndmUgYWNjZXB0ZWQgdGhlbS4gU28gSSd2
ZQpiZWVuIGV4cGVyaW1lbnRpbmcgd2l0aCBnaXRsYWIgQ0kgYW5kIGludGVncmF0aW9uIHdpdGgg
cGF0Y2h3b3JrIGEgYml0CnJlY2VudGx5LiBJIGhhdmUgZ2l0bGFiIENJIHJ1bm5pbmcgc29tZSB0
ZXN0cyBvbiBiaW5kaW5nIHBhdGNoZXMKKGNoZWNrcGF0Y2ggYW5kIHNjaGVtYSB2YWxpZGF0aW9u
KSwgYXR0YWNoaW5nIHRoZSByZXN1bHRzIHRvIHRoZSBEVApwYXRjaHdvcmsgaW5zdGFuY2UsIGFu
ZCB1cGRhdGluZyB0aGUgcGF0Y2ggc3RhdGUuIEhlcmUgaXMgYW4gZXhhbXBsZQpwYXRjaFsxXSwg
bXkgcGF0Y2h3b3JrIHJlbGF0ZWQgc2NyaXB0cyBhcmUgaGVyZVsyXSwgYW5kIHRoZSBDSSBqb2Ig
aXMKaGVyZVszXS4KClJvYgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gv
OTc5NjEzLwpbMl0gaHR0cHM6Ly9naXRsYWIuY29tL3JvYmhlcnJpbmcvcHctdXRpbHMKWzNdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9yb2JoZXJyaW5nL2xpbnV4Ly0vam9icwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
