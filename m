Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E17C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:50:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6147B601FC
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6147B601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rtw/6vTQfWRqoNxL0+pMngGTWjO8pKe6Kg+3SrdQztg=; b=ISrhe4sig0vmXpgkj78X1PDBM
	FdfW7G4T6ML8FSsseQNB+CbsgjQgwfeuafcyR+R7JuPCAnJytzzV9tpFhindy8Xz6/PivI66e1cQv
	J/TX/3F0g1v2uXcslw/FUo3Q3JL+oEBHEQgAFUDHwEfygUOL51loZq5TkReFGrLsFb+SRli8xAWSt
	06uhYC3XYYFQAmfKEgGYBraQae0xs+1vbSNlX4McHRVquOCJzlc4r3eDii+p9HLxe7u5G8eK8WO7B
	NgUkivtvCtX9qGDf6Ia8kpakcIqshFKRhdx/mpaRsJ/9tU8zEENpflvY1dyf6c0MU82qmd0SxLc2W
	uNV+3I71w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPoiy-003uoL-Sh; Fri, 26 Mar 2021 15:50:12 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPoin-003umv-No; Fri, 26 Mar 2021 15:50:03 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6RHp3FcVz9v0N7;
 Fri, 26 Mar 2021 16:49:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GMS7qKW9a4qh; Fri, 26 Mar 2021 16:49:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6RHp1M13z9v0N3;
 Fri, 26 Mar 2021 16:49:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C764C8B8D7;
 Fri, 26 Mar 2021 16:49:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UQFsEfZGymR7; Fri, 26 Mar 2021 16:49:59 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD5ED8B8C7;
 Fri, 26 Mar 2021 16:49:58 +0100 (CET)
Subject: Re: [PATCH v3 05/17] arm: Convert to GENERIC_CMDLINE
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Daniel Walker <danielwa@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 microblaze <monstr@monstr.eu>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, nios2 <ley.foon.tan@intel.com>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>, X86 ML <x86@kernel.org>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
 <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c18ef8f7-8e79-a9d3-3853-f8b992a4fc93@csgroup.eu>
Date: Fri, 26 Mar 2021 16:49:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_155001_849186_1490FB69 
X-CRM114-Status: GOOD (  11.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAyNi8wMy8yMDIxIMOgIDE2OjQ3LCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgTWFyIDI2LCAyMDIxIGF0IDc6NDQgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Pgo+PiBUaGlzIGNvbnZlcnRzIHRoZSBhcmNoaXRl
Y3R1cmUgdG8gR0VORVJJQ19DTURMSU5FLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+IC0tLQo+PiAgIGFyY2gvYXJt
L0tjb25maWcgICAgICAgICAgICAgIHwgMzggKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4gICBhcmNoL2FybS9rZXJuZWwvYXRhZ3NfcGFyc2UuYyB8IDE1ICsrKysrLS0tLS0t
LS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vS2NvbmZpZyBiL2FyY2gvYXJtL0tjb25maWcK
Pj4gaW5kZXggNWRhOTZmNWRmNDhmLi42N2JjNzVmMmRhODEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
YXJtL0tjb25maWcKPj4gKysrIGIvYXJjaC9hcm0vS2NvbmZpZwo+PiBAQCAtNTAsNiArNTAsNyBA
QCBjb25maWcgQVJNCj4+ICAgICAgICAgIHNlbGVjdCBHRU5FUklDX0FSQ0hfVE9QT0xPR1kgaWYg
QVJNX0NQVV9UT1BPTE9HWQo+PiAgICAgICAgICBzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiBD
UFVfVjdNIHx8IENQVV9WNiB8fCAhQ1BVXzMydjZLIHx8ICFBRUFCSQo+PiAgICAgICAgICBzZWxl
Y3QgR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCj4+ICsgICAgICAgc2VsZWN0
IEdFTkVSSUNfQ01ETElORSBpZiBBVEFHUwo+IAo+IERvbid0IHdlIG5lZWQgdGhpcyBlbmFibGVk
IGZvciAhQVRBR1MgKGkuZS4gRFQgYm9vdCk/Cj4gCj4gQ2FuIHdlIGFsd2F5cyBlbmFibGUgR0VO
RVJJQ19DTURMSU5FIGZvciBPRl9FQVJMWV9GTEFUVFJFRT8KPiAKCkRvbid0IGtub3cuCgpUb2Rh
eSBBUk0gaGFzOgoKY2hvaWNlCglwcm9tcHQgIktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIgaWYg
Q01ETElORSAhPSAiIgoJZGVmYXVsdCBDTURMSU5FX0ZST01fQk9PVExPQURFUgoJZGVwZW5kcyBv
biBBVEFHUwoKCgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
