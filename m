Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2909DC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ztns6NSVWsYkl+NB1rS9VoGy6ZWg/XmvzL0jFqPKz4E=; b=MCaBWslP9gE7IB
	+oUNJfhTG53PGRiFSP4/XcJxhvRByCaax8AWDyMAPj/C/xi3wzrPZJaBR+rLIX5VASXQcGAcXEFZg
	L80dc+gjf5FVRSAaFNRpWT/NAwa8+8+s+oGoJSUa6uyxLUPDyoAxAe/5C8PSxrVN0P9tRZFl0Q3Gh
	+/4TzSJ07M0qNWhY/tNxtgUo61wx1RZKsgz/OkzXzoZkKkHg725KtjY6BjZ1iFvmH4JmiPvYXfdac
	vcrdvSSRTbUXdUOG1ernbxsAWetb8wVN4bkAc3QHVZz2WIoBzwi7rgYqGTcuZuScNfRAaU/8GL7aw
	C47Upij5IZok6PJGQ7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIZb-00ACrv-0B;
	Wed, 17 May 2023 14:56:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIZX-00ACpO-0v
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 14:56:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so65402445e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684335364; x=1686927364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy01pDU5gpvvu40QdwUDSi9Rn8BJ+AlfGupuASEwzFs=;
        b=jaU0MTMcpsi5e11qScCf/2APvXYvWwIWHm5HZITAA/TYgvG+TzWJjw1k9KkADFndAl
         hGog+rgFaQ6At23WsARj/362a3S0xlbQkZQsvjRnc11X4h1HUeDg5CdotjmZoIAuqJmR
         /mpGK2vT0D9xt4tdnsNet9liylvPFg5KI6l+v6OgfkVl6IFoJXVsHhhUZVdoOjN0TsNS
         0l7+1u5NRev4Ky5IwSHIV2yfOI4lwuQ99UD0OVY6ifa1QaXiQ76VTsiB2hiS2Wr9kJur
         W+58TcD/EI3VxnCU77BXtx8wIHmn1c8cnGJzuF2/8eV9ZoOXltrVxeg61GmtC0asAWz8
         BtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684335364; x=1686927364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy01pDU5gpvvu40QdwUDSi9Rn8BJ+AlfGupuASEwzFs=;
        b=ddDSDug0Vb4F3SwO+Gsl9u02+IMZTIeOC+zu+Tcgf+xzqmkp1fJPvDTBW3fSG4Ss9e
         9ulshwLCordHz5/rbeH6v1PEnINK7NOsCHHCC7KLfO81SWoEHqARUaF6k1EXkQFX7Np4
         ZRRXuR6RVWk16cObrevWrHbdJZLK309ZFrXMrxLee2PATqaumaVYTy/knLn5+YjR66CI
         LWV+YcoN7+Ii2yUQbA8riQeiWNsIcj5qavbvP/1orL1bwE93l3pxwN0NqHx0QzQ4Ms2D
         7S2OLZvP5xBfmStDvpoSsZPNLMiPS1nVj1MPsbrgAJO07iHiXlixhOBJr+RXGTqcvF62
         K9Ng==
X-Gm-Message-State: AC+VfDw99aUtP/BmbHy4LDpcXfLJ8Ua40iey0CcZ/BMuQz/8ha3mHHLm
	1e0uiaTEMP/PblBF/eYcF/mCN/JJ7Y1UHzhEw0eLBQ==
X-Google-Smtp-Source: ACHHUZ5AL12iNPyGhfApc5Ia9Kgnuj/3cquvZ8Z2EKmlj5mtSIfji76qS3UA0nS1hCYb3SYhjSn2nKXlugh0ZzWWuYY=
X-Received: by 2002:a1c:f613:0:b0:3f3:3cba:2f2d with SMTP id
 w19-20020a1cf613000000b003f33cba2f2dmr2096949wmc.7.1684335364254; Wed, 17 May
 2023 07:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com> <20230517-preacher-primer-f41020b3376a@wendy>
In-Reply-To: <20230517-preacher-primer-f41020b3376a@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 17 May 2023 16:55:53 +0200
Message-ID: <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Song Shuai <suagrfillet@gmail.com>, robh@kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, anup@brainfault.org, palmer@rivosinc.com, 
	jeeheng.sia@starfivetech.com, leyfoon.tan@starfivetech.com, 
	mason.huo@starfivetech.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_075611_324440_940ADA90 
X-CRM114-Status: GOOD (  35.46  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMToyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEFsZXgsCj4KPiBPbiBXZWQsIE1heSAx
NywgMjAyMyBhdCAxMDo1ODowMkFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBP
biBUdWUsIE1heSAxNiwgMjAyMyBhdCAxOjEy4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+ID4gPiBPbiBUdWUsIE1heSAxNiwgMjAyMyBhdCAx
MToyNOKAr0FNIFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+
IEkgYWN0dWFsbHkgcmVtb3ZlZCB0aGlzIGZsYWcgYSBmZXcgeWVhcnMgYWdvLCBhbmQgSSBoYXZl
IHRvIGFkbWl0IHRoYXQKPiA+ID4gSSBuZWVkIHRvIGNoZWNrIGlmIHRoYXQncyBuZWNlc3Nhcnk6
IHRoZSBnb2FsIG9mIGNvbW1pdCAzMzM1MDY4Zjg3MjEKPiA+ID4gKCJyaXNjdjogVXNlIFBVRC9Q
NEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBpbmciKSBpcyB0byBleHBvc2UKPiA+ID4g
dGhlICJyaWdodCIgc3RhcnQgb2YgRFJBTSBzbyB0aGF0IHdlIGNhbiBhbGlnbiB2aXJ0dWFsIGFu
ZCBwaHlzaWNhbAo+ID4gPiBhZGRyZXNzZXMgb24gYSAxR0IgYm91bmRhcnkuCj4gPiA+Cj4gPiA+
IFNvIEkgaGF2ZSB0byBjaGVjayBpZiBhIG5vbWFwIHJlZ2lvbiBpcyBhY3R1YWxseSBhZGRlZCBh
cyBhCj4gPiA+IG1lbWJsb2NrLm1lbW9yeS5yZWdpb25zW10gb3Igbm90OiBpZiB5ZXMsIHRoYXQn
cyBwZXJmZWN0LCBsZXQncyBhZGQKPiA+ID4gdGhlIG5vbWFwIGF0dHJpYnV0ZXMgdG8gdGhlIFBN
UCByZWdpb25zLCBvdGhlcndpc2UsIEkgZG9uJ3QgdGhpbmsgdGhhdAo+ID4gPiBpcyBhIGdvb2Qg
c29sdXRpb24uCj4gPgo+ID4gU28gaGVyZSBpcyB0aGUgY3VycmVudCBsaW5lYXIgbWFwcGluZyB3
aXRob3V0IG5vbWFwIGluIG9wZW5TQkk6Cj4gPgo+ID4gLS0tWyBMaW5lYXIgbWFwcGluZyBdLS0t
Cj4gPiAweGZmNjAwMDAwMDAwMDAwMDAtMHhmZjYwMDAwMDAwMjAwMDAwICAgIDB4MDAwMDAwMDA4
MDAwMDAwMCAgICAgICAgIDJNCj4gPiBQTUQgICAgIEQgQSBHIC4gLiBXIFIgVgo+ID4gMHhmZjYw
MDAwMDAwMjAwMDAwLTB4ZmY2MDAwMDAwMGUwMDAwMCAgICAweDAwMDAwMDAwODAyMDAwMDAgICAg
ICAgIDEyTQo+ID4gUE1EICAgICBEIEEgRyAuIC4gLiBSIFYKPiA+Cj4gPiBBbmQgYmVsb3cgdGhl
IGxpbmVhciBtYXBwaW5nIHdpdGggbm9tYXAgaW4gb3BlblNCSToKPiA+Cj4gPiAtLS1bIExpbmVh
ciBtYXBwaW5nIF0tLS0KPiA+IDB4ZmY2MDAwMDAwMDA4MDAwMC0weGZmNjAwMDAwMDAyMDAwMDAg
ICAgMHgwMDAwMDAwMDgwMDgwMDAwICAgICAgMTUzNksKPiA+IFBURSAgICAgRCBBIEcgLiAuIFcg
UiBWCj4gPiAweGZmNjAwMDAwMDAyMDAwMDAtMHhmZjYwMDAwMDAwZTAwMDAwICAgIDB4MDAwMDAw
MDA4MDIwMDAwMCAgICAgICAgMTJNCj4gPiBQTUQgICAgIEQgQSBHIC4gLiAuIFIgVgo+ID4KPiA+
IFNvIGFkZGluZyBub21hcCBkb2VzIG5vdCBtaXNhbGlnbiB2aXJ0dWFsIGFuZCBwaHlzaWNhbCBh
ZGRyZXNzZXMsIGl0Cj4gPiBwcmV2ZW50cyB0aGUgdXNhZ2Ugb2YgMUdCIHBhZ2UgZm9yIHRoaXMg
YXJlYSB0aG91Z2gsIHNvIHRoYXQncyBhCj4gPiBzb2x1dGlvbiwgd2UganVzdCBsb3NlIHRoaXMg
MUdCIHBhZ2UgaGVyZS4KPiA+Cj4gPiBCdXQgZXZlbiB0aG91Z2ggdGhhdCBtYXkgYmUgdGhlIGZp
eCwgSSB0aGluayB3ZSBhbHNvIG5lZWQgdG8gZml4IHRoYXQKPiA+IGluIHRoZSBrZXJuZWwgYXMg
aXQgd291bGQgYnJlYWsgY29tcGF0aWJpbGl0eSB3aXRoIGNlcnRhaW4gdmVyc2lvbnMgb2YKPiA+
IG9wZW5TQkkgKmlmKiB3ZSBmaXggb3BlblNCSS4uLlNvIGhlcmUgYXJlIGEgZmV3IHNvbHV0aW9u
czoKPiA+Cj4gPiAxLiB3ZSBjYW4gbWFyayBhbGwgIm1tb2RlX3Jlc3YiIG5vZGVzIGluIHRoZSBk
ZXZpY2UgdHJlZSBhcyBub21hcCwKPiA+IGJlZm9yZSB0aGUgbGluZWFyIG1hcHBpbmcgaXMgZXN0
YWJsaXNoZWQgKElJVUMsIHRob3NlIG5vZGVzIGFyZSBhZGRlZAo+ID4gYnkgb3BlblNCSSB0byBh
ZHZlcnRpc2UgUE1QIHJlZ2lvbnMpCj4gPiAgICAgLT4gVGhpcyBhbW91bnRzIHRvIHRoZSBzYW1l
IGZpeCBhcyBvcGVuc2JpIGFuZCB3ZSBsb3NlIHRoZSAxR0IgaHVnZXBhZ2UuCj4KPiBBRkFJVSwg
bG9zaW5nIHRoZSAxIEdCIGh1Z2VwYWdlIGlzIGEgcmVncmVzc2lvbiwgd2hpY2ggd291bGQgbWFr
ZSB0aGlzCj4gbm90IGFuIG9wdGlvbiwgcmlnaHQ/CgpOb3Qgc3VyZSB0aGlzIGlzIGEgcmVhbCBy
ZWdyZXNzaW9uLCBJJ2QgcmF0aGVyIGF2b2lkIGl0LCBidXQgYXMKbWVudGlvbmVkIGluIG15IGZp
cnN0IGFuc3dlciwgTWlrZSBSYXBvcG9ydCBzaG93ZWQgdGhhdCBpdCB3YXMgbWFraW5nCm5vIGRp
ZmZlcmVuY2UgcGVyZm9ybWFuY2Utd2lzZS4uLgoKPgo+ID4gMi4gd2UgY2FuIHR3ZWFrIHBmbl9p
c19ub3NhdmUgZnVuY3Rpb24gdG8gKm5vdCogc2F2ZSBwZm4gY29ycmVzcG9uZGluZwo+ID4gdG8g
UE1QIHJlZ2lvbnMKPiA+ICAgICAtPiBXZSBkb24ndCBsb3NlIHRoZSAxR0IgaHVnZXBhZ2UgXG8v
Cj4gPiAzLiB3ZSBjYW4gdXNlIHJlZ2lzdGVyX25vc2F2ZV9yZWdpb24oKSB0byBub3Qgc2F2ZSB0
aGUgIm1tb2RlX3Jlc3YiCj4gPiByZWdpb25zICh4ODYgZG9lcyB0aGF0Cj4gPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni40LXJjMS9zb3VyY2UvYXJjaC94ODYva2VybmVsL2U4
MjAuYyNMNzUzKQo+ID4gICAgIC0+IFdlIGRvbid0IGxvc2UgdGhlIDFHQiBodWdlcGFnZSBcby8K
PiA+IDQuIEdpdmVuIEplZUhlbmcgcG9pbnRlciB0bwo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjYuNC1yYzEvc291cmNlL2tlcm5lbC9wb3dlci9zbmFwc2hvdC5jI0wxMzQw
LAo+ID4gd2UgY2FuIG1hcmsgdGhvc2UgcGFnZXMgYXMgbm9uLXJlYWRhYmxlIGFuZCBtYWtlIHRo
ZSBoaWJlcm5hdGlvbgo+ID4gcHJvY2VzcyBub3Qgc2F2ZSB0aG9zZSBwYWdlcwo+ID4gICAgIC0+
IFZlcnkgbGF0ZS1pbi10aGUtZGF5IGlkZWEsIG5vdCBzdXJlIHdoYXQgaXQncyB3b3J0aCwgd2Ug
YWxzbwo+ID4gbG9zZSB0aGUgMUdCIGh1Z2VwYWdlLi4uCj4KPiBEaXR0byBoZXJlIHJlOiBpbnRy
b2R1Y2luZyBhbm90aGVyIHJlZ3Jlc3Npb24uCj4KPiA+IFRvIG1lLCB0aGUgYmVzdCBzb2x1dGlv
biBpcyAzIGFzIGl0IHdvdWxkIHByZXBhcmUgZm9yIG90aGVyIHNpbWlsYXIKPiA+IGlzc3VlcyBs
YXRlciwgaXQgaXMgc2ltaWxhciB0byB4ODYgYW5kIGl0IGFsbG93cyB1cyB0byBrZWVwIDFHQgo+
ID4gaHVnZXBhZ2VzLgo+ID4KPiA+IEkgaGF2ZSBiZWVuIHRoaW5raW5nLCBhbmQgdG8gbWUgbm9t
YXAgZG9lcyBub3QgcHJvdmlkZSBhbnl0aGluZyBzaW5jZQo+ID4gdGhlIGtlcm5lbCBzaG91bGQg
bm90IGFkZHJlc3MgdGhpcyBtZW1vcnkgcmFuZ2UsIHNvIGlmIGl0IGRvZXMsIHdlCj4gPiBtdXN0
IGZpeCB0aGUga2VybmVsLgo+ID4KPiA+IExldCBtZSBrbm93IHdoYXQgeW91IGFsbCB0aGluaywg
SSdsbCBiZSBwcmVwYXJpbmcgYSBQb0Mgb2YgMyBpbiB0aGUgbWVhbnRpbWUhCj4KPiAjMyB3b3Vs
ZCBwcm9iYWJseSBnZXQgbXkgdm90ZSB0b28uIEl0IHNlZW1zIGxpa2UgeW91IGNvdWxkIHVzZSBp
dAo+IGR5bmFtaWNhbGx5IGlmIHRoZXJlIHdhcyB0byBiZSBhIGZ1dHVyZSBvdGhlciBwcm92aWRl
ciBvZiAibW1vZGVfcmVzdiIKPiByZWdpb25zLCByYXRoZXIgdGhhbiBkb2luZyBzb21ldGhpbmcg
bG9jYXRpb24tc3BlY2lmaWMuCj4KPiBXZSBzaG91bGQgcHJvYmFibHkgZG9jdW1lbnQgdGhlc2Ug
b3BlbnNiaSByZXNlcnZlZCBtZW1vcnkgbm9kZXMgdGhvdWdoCj4gaW4gYSBkdC1iaW5kaW5nIG9y
IHcvZSBpZiB3ZSBhcmUgZ29pbmcgdG8gYmUgcmVseWluZyBvbiB0aGVtIHRvIG5vdAo+IGNyYXNo
IQoKWWVzLCB5b3UncmUgcmlnaHQsIGxldCdzIHNlZSB3aGF0IEF0aXNoIGFuZCBBbnVwIHRoaW5r
IQoKVGhhbmtzIGZvciB5b3VyIHF1aWNrIGFuc3dlcnMgQ29ub3IgYW5kIFNvbmcsIHJlYWxseSBh
cHByZWNpYXRlZCEKCkFsZXgKCj4KPiBUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcywKPiBDb25v
ci4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
