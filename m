Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k3i4ifZG3NolSgWaDf5iEEhlZHBSAKTiTIjwoph3/I=; b=s0BjoOmpCboRSz
	iC3/7g+b60KI0IOTuOqzCrJXEHzm4lHUqUaZ3As4Iz3SbQ8rW+/f+EVS0Kk9cNY17sH1vZpYjQdjS
	hfnygEW7HS2J7vzZS2SmFnTHmimmrhgCJd6MY0R87QZaE/zlpE5LOGaB2tuOIEz+cEgZzN/mPMCPn
	6G4B3hMFbTsqyQo8OIasSyTNayj+5L++o6RIdg7kSSWfd2djj81IlxXqOz40mOiFYKiX/A5kwQvGT
	rN0K0ccZM0UdEoMEh44zga7hLdFAE4rklQwz+DLvpkj/+JAkC2P8pJ8RG0s9Y45oJxhOeBAAXjtWL
	LHyXKmiRZpKBw1tJexKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWaw-00EbSz-IJ; Thu, 05 May 2022 08:12:18 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWak-00EbPe-UE; Thu, 05 May 2022 08:12:08 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2454o237019760;
 Thu, 5 May 2022 08:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=z4sq9VpdyC1twtJvv6LraDF4oC5l7K1Gjqz/EX96h48=;
 b=byg8yPH7lB6IZpHqaGAW/IeqHBFw1qVNnemAYMuW6RqtAD2Pr44LXtY5qhdvLHHtmyHS
 zx9iz65kowFV3EWLgEN1WG/d59kZe4yfXhGahlw0zEySpnmOMpKtnTu1H+qcza8lcgus
 VP1jt7FqQK3My93W8lTLtP5pcjNasJUlrXI0Oj9oLP5ti+9vQ6TEUWY2ibcsPnUs14uv
 NmvMjJPL0KUnhOk2z1eHsYp83y9pSRyRUfpRV7sovwq8yCY9xzBZFlBb50MQwBEdnaiO
 0N3pnELj4DvaEamDhYosnYTLvIbL2KA1mWAd5tpRBkVo6hFlV6xAvxmWORtU26wlKUnZ hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv7w5ayn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 08:10:24 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24580f9U005340;
 Thu, 5 May 2022 08:10:23 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv7w5ayks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 08:10:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245884X7030065;
 Thu, 5 May 2022 08:10:20 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3fttcj2t2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 08:10:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2458AH1F53543266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 08:10:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C65511C050;
 Thu,  5 May 2022 08:10:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B05911C04A;
 Thu,  5 May 2022 08:10:15 +0000 (GMT)
Received: from sig-9-145-85-251.uk.ibm.com (unknown [9.145.85.251])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 08:10:15 +0000 (GMT)
Message-ID: <ce5510ff230fe76d9a74d0368d7d5be22011ff88.camel@linux.ibm.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, linux-arch
 <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul
 Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:RISC-V ARCHITECTURE"
 <linux-riscv@lists.infradead.org>, "open list:SUPERH"
 <linux-sh@vger.kernel.org>, "open list:SPARC + UltraSPARC (sparc/sparc64)"
 <sparclinux@vger.kernel.org>
Date: Thu, 05 May 2022 10:10:15 +0200
In-Reply-To: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
References: <20220429135108.2781579-2-schnelle@linux.ibm.com>
 <20220504210840.GA469916@bhelgaas>
 <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TfB74bisdmBom1WXjB4-tPfxPcdeJalQ
X-Proofpoint-ORIG-GUID: fSEH5H7pwKFZyghH7nTHuMCiubmCCcLs
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_02,2022-05-04_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=278 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_011207_008494_4FD46E3E 
X-CRM114-Status: GOOD (  39.10  )
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

T24gV2VkLCAyMDIyLTA1LTA0IGF0IDIzOjMxICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDQsIDIwMjIgYXQgMTE6MDggUE0gQmpvcm4gSGVsZ2FhcyA8aGVsZ2Fhc0Br
ZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDI5LCAyMDIyIGF0IDAzOjQ5OjU5UE0g
KzAyMDAsIE5pa2xhcyBTY2huZWxsZSB3cm90ZToKPiA+ID4gV2UgaW50cm9kdWNlIGEgbmV3IEhB
U19JT1BPUlQgS2NvbmZpZyBvcHRpb24gdG8gaW5kaWNhdGUgc3VwcG9ydCBmb3IKPiA+ID4gSS9P
IFBvcnQgYWNjZXNzLiBJbiBhIGZ1dHVyZSBwYXRjaCBIQVNfSU9QT1JUPW4gd2lsbCBkaXNhYmxl
IGNvbXBpbGF0aW9uCj4gPiA+IG9mIHRoZSBJL08gYWNjZXNzb3IgZnVuY3Rpb25zIGluYigpL291
dGIoKSBhbmQgZnJpZW5kcyBvbiBhcmNoaXRlY3R1cmVzCj4gPiA+IHdoaWNoIGNhbiBub3QgbWVh
bmluZ2Z1bGx5IHN1cHBvcnQgbGVnYWN5IEkvTyBzcGFjZXMgc3VjaCBhcyBzMzkwIG9yCj4gPiA+
IHdoZXJlIHN1Y2ggc3VwcG9ydCBpcyBvcHRpb25hbC4KPiA+IAo+ID4gU28geW91IHBsYW4gdG8g
ZHJvcCBpbmIoKS9vdXRiKCkgb24gYXJjaGl0ZWN0dXJlcyB3aGVyZSBJL08gcG9ydCBzcGFjZQo+
ID4gaXMgb3B0aW9uYWw/ICBTbyBldmVuIHBsYXRmb3JtcyB0aGF0IGhhdmUgSS9PIHBvcnQgc3Bh
Y2UgbWF5IG5vdCBiZQo+ID4gYWJsZSB0byB1c2UgaXQ/Cj4gPiAKPiA+IFRoaXMgZmVlbHMgbGlr
ZSBhIGxvdCBvZiB3b3JrIHdoZXJlIHRoZSBtYWluIGJlbmVmaXQgaXMgdG8ga2VlcAo+ID4gS2Nv
bmZpZyBmcm9tIG9mZmVyaW5nIGRyaXZlcnMgdGhhdCBhcmVuJ3Qgb2YgaW50ZXJlc3Qgb24gczM5
MC4KPiA+IAo+ID4gR3JhbnRlZCwgdGhlcmUgbWF5IGJlIGlzc3VlcyB3aGVyZSBpbmIoKS9vdXRi
KCkgZG9lcyB0aGUgd3JvbmcgdGhpbmcKPiA+IHN1Y2ggYXMgZGVyZWZlcmVuY2luZyBudWxsIHBv
aW50ZXJzIHdoZW4gSS9PIHBvcnQgc3BhY2UgaXNuJ3QKPiA+IGltcGxlbWVudGVkLiAgSSB0aGlu
ayB0aGF0J3MgYSBkZWZlY3QgaW4gaW5iKCkvb3V0YigpIGFuZCBjb3VsZCBiZQo+ID4gZml4ZWQg
dGhlcmUuCj4gCj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaW4gYXNtLWdlbmVyaWMvaW8u
aCBpbXBsZW1lbnRzIGluYigpL291dGIoKQo+IHVzaW5nIHJlYWRiKCkvd3JpdGViKCkgd2l0aCBh
IGZpeGVkIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBvZmZzZXQuCj4gCj4gVGhlcmUgYXJlIHRocmVl
IHBvc3NpYmxlIHRoaW5ncyB0aGF0IGNhbiBoYXBwZW4gaGVyZToKPiAKPiBhKSB0aGVyZSBpcyBh
IGhvc3QgYnJpZGdlIGRyaXZlciB0aGF0IG1hcHMgaXRzIEkvTyBwb3J0cyB0byB0aGlzIHdpbmRv
dywKPiAgICAgYW5kIGV2ZXJ5dGhpbmcgd29ya3MKPiBiKSB0aGUgYWRkcmVzcyByYW5nZSBpcyBy
ZXNlcnZlZCBhbmQgYWNjZXNzaWJsZSBidXQgbm8gaG9zdCBicmlkZ2UKPiAgICBkcml2ZXIgaGFz
IG1hcHBlZCBpdHMgcmVnaXN0ZXJzIHRoZXJlLCBzbyBhbiBhY2Nlc3MgY2F1c2VzIGEKPiAgICBw
YWdlIGZhdWx0Cj4gYykgdGhlIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBkZWZpbmUgYW4gb2Zmc2V0
LCBhbmQgYWNjZXNzaW5nIGxvdyBJL08KPiAgICAgcG9ydHMgZW5kcyB1cCBhcyBhIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZQo+IAo+IFRoZSBtYWluIGdvYWwgaXMgdG8gYXZvaWQgYyksIHdoaWNo
IGlzIHdoYXQgaGFwcGVucyBvbiBzMzkwLCBidXQKPiBjYW4gYWxzbyBoYXBwZW4gZWxzZXdoZXJl
LiBDYXRjaGluZyBiKSB3b3VsZCBiZSBuaWNlIGFzIHdlbGwsCj4gYnV0IGlzIG11Y2ggaGFyZGVy
IHRvIGRvIGZyb20gZ2VuZXJpYyBjb2RlIGFzIHlvdSdkIG5lZWQgYW4KPiBhcmNoaXRlY3R1cmUg
c3BlY2lmaWMgaW5saW5lIGFzbSBzdGF0ZW1lbnQgdG8gaW5zZXJ0IGEgZXhfdGFibGUKPiBmaXh1
cCwgb3IgYSBydW50aW1lIGNvbmRpdGlvbmFsIG9uIGVhY2ggYWNjZXNzLgo+IAo+ICAgICAgICAg
IEFybmQKClllcyBhbmQgdG8gYWRkIHRvIHRoaXMsIHdlIGRpZCB0cnkgYSBsb2NhbCBzb2x1dGlv
biBpbiBpbmIoKS9vdXRiKCkKYmVmb3JlLiBUaGlzIGFkZGVkIGEgd2FybmluZyB3aGVuIHRoZXkg
YXJlIHVzZWQgYW5kIHdlIGtub3cgYXQgY29tcGlsZQp0aW1lIHRoYXQgd2UncmUgZGVhbGluZyB3
aXRoIGNhc2UgYykuIFRoaXMgYXBwcm9hY2ggd2FzIG5hY2tlZCBieSBMaW51cwp0aG91Z2ggYXMg
d2Ugd2VyZSB0dXJuaW5nIGEgY29tcGlsZSB0aW1lIGtub3duIGJyb2tlbiBjYXNlIGludG8gYQpy
dW50aW1lIG9uZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FIay09d2c4MGplPUs3
bWFkRjRlN1dyUk5wMzdlM3FoNnkxMFN2aGRjN084U1pfLThnQG1haWwuZ21haWwuY29tLwoKSSBk
byBhZ3JlZSB3aXRoIHRoaXMgYXNzZXNtZW50IGFuZCB0aGluayB0aGlzIGlzIHRoZSByaWdodOKE
oiBhcHByb2FjaApidXQgaXQgaXMgbW9yZSBjaHVybiBhcyBjYW4gYmUgc2VlbiBieSB0aGUgc2l6
ZSBvZiB0aGlzIHNlcmllcy4gSSB0aGluawpsb25nZXIgdGVybSBpdCBjb3VsZCBiZSB2YWx1YWJs
ZSB0aG91Z2ggZXNwZWNpYWxseSBpZiBtb3JlIHBsYXRmb3JtcwpwaGFzZSBvdXQgSS9PIHBvcnQg
c3VwcG9ydCBsaWtlIFBPV0VSOSBmb3Igd2hpY2ggdGhpcyBhbHNvIGFsbG93cwpmaWx0ZXJpbmcg
d2hhdCBkcml2ZXJzIHdpbGwgbmV2ZXIgd29yay4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
