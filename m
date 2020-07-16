Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60167C433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 15:53:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC232064B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 15:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ddUvmYfP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC232064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bP4Go9z9kS1TkhlLPU67QilSPi5TT8r7rxOyrcr9FRs=; b=ddUvmYfPa0Ussj3jxBFdCDUow
	ykeXXqXCnC+qOjskSsoQhp0HdyC1mBxSBCzsVUeUnDZgzHdUXbh42Bh4u47D4RrZ0VQaGDKtgVKVd
	1yjw7wrb66wsDHutCDTAu/gtLR/IQSJnjPtsFWaOhdwK2VGcIJuCc5kOS5AAFlnFiRnHkeFCh/ZQA
	gcdnHD4Zd0RsHYaTOJxUYRkWJRBgblgfDFR1FaL9gzTfh86112M93uNn3wd7ey0TobPtZ0RjzIq9I
	loWoFamzvrV5APhL4hplU65mrtIkzYEDbCXKjkcX5XKV2xOb68hky0GHSxCI0gtJFwvDXyJlNih2T
	cRU9rewBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw6By-0004QZ-Uy; Thu, 16 Jul 2020 15:53:02 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw6Bw-0004Pe-TR
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 15:53:02 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 06GFqj11009988; Thu, 16 Jul 2020 18:52:45 +0300 (EEST)
X-AuditID: 8b5b014d-241ff700000045c5-f2-5f1077c86a07
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 57.6E.17861.8C7701F5; Thu, 16 Jul 2020 18:52:40 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 16 Jul 2020 18:52:40 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Add crash kernel support
Organization: FORTH
In-Reply-To: <mhng-cf27f8bc-90c8-4ba2-a172-78af9e182f62@palmerdabbelt-glaptop1>
References: <mhng-cf27f8bc-90c8-4ba2-a172-78af9e182f62@palmerdabbelt-glaptop1>
Message-ID: <0855d245f350336051debe8244694db6@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.9
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsXSHT1dWfdEuUC8wdWj2hYtH96xWixa8Z3F
 YsvhR8wW2z63sFk0vzvHbvHycg+zRdssfoumF9eZLT7cnc3mwOkx9fcZFo+uHzNYPd68fMni
 8XDTJSaPzUvqPS41X2f3aD/QzRTAHsVlk5Kak1mWWqRvl8CV8ebZDvaCRawV7398Z29gnMPS
 xcjBISFgInHmmFoXIxeHkMBRRolnX58xdzFyAsVNJWbv7WQEsXkFBCVOznzCAmIzC1hITL2y
 nxHClpdo3jqbGWQOi4CqxJxt3iBhNgFNifmXDoKViwioSxx4fYcZZD6zQDuTxLkpJ8HmCwvY
 SDxrnglWxC8gLPHp7kVWEJtTwF9i1+u9YLaQgJ/ErEUN7BA3uEhcOLaEDeI2FYkPvx+AxUUF
 lCVuHn7OPoFRcBaSU2chOXUWklMXMDKvYhRILDPWy0wu1kvLLyrJ0Esv2sQIjgtG3x2Mtze/
 1TvEyMTBeIhRgoNZSYSXh4s3Xog3JbGyKrUoP76oNCe1+BCjNAeLkjhvHvfyWCGB9MSS1OzU
 1ILUIpgsEwenVAPT1lWlZ45P1oyMMpw351TBtmfCT3LvzPp0V3T+FPO5wTZJbDs4f0wP/iP2
 ct6Ks0wOhxmXsiR8L5nna2BcvnWWs3T2LhX2HC6ZeSKPTOyX1T31lxHbGJK/RWhhUc3sx5In
 5gk+OfHJv2aTc0fOvB/lq++ucTtx0Hcp/+ur/HGCk19ovWnZExzw1Hr6B7fvtSl61c9OMF8V
 2hb3XvL56nfV37yD9u/fd/npUZu77N7JDhoFtvfVH39dcOLcoTLhoHclvt1X9s3iF9o9XzJ/
 ZuHH3qWnJbUVBabuOJxUsfyBxLvglxHN+Q6THnks2qLIfNi5aMu7r/PadN7JfNW/v8XYtjjz
 U7pDXTdHf9d5E5fE7UosxRmJhlrMRcWJAHX3Pfr6AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_115301_241439_93E40410 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org,
 Atish Patra <Atish.Patra@wdc.com>, yibin_liu@c-sky.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMC0wNy0xMSAwNjo1OSwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFR1ZSwgMjMgSnVuIDIwMjAgMDg6MDU6MTIgUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAuLjgx
YjlkMmE3MQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NyYXNo
X2R1bXAuYwo+PiBAQCAtMCwwICsxLDQ2IEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAo+PiArLyoKPj4gKyAqIFRoaXMgY29kZSBjb21lcyBmcm9tIGFyY2gvYXJtNjQv
a2VybmVsL2NyYXNoX2R1bXAuYwo+IAo+IFdoaWNoIGlzICJHUEwtMi4wLW9ubHkiLCBub3QgIkdQ
TC0yLjAiLiAgSSBqdXN0IHNlbnQgb3V0IGEgcGF0Y2ggc2V0IHRvIAo+IG1ha2UKPiB0aGlzIGdl
bmVyaWMsIGFzIGEgaGFuZGZ1bCBvZiBhcmNoaXRlY3R1cmVzIHVzZSBpdCBleGFjdGx5IChhbmQg
c29tZSAKPiBvdGhlcnMgbWF5Cj4gYmUgYWJsZSB0bykuCj4gCgpHb29kIGNhbGwsIGl0J2xsIGJl
IG11Y2ggY2xlYW5lciB0aGlzIHdheSwgdGhhbmsgeW91ICEgSSdsbCByZS1zZW5kIHRoaXMgCm9u
Y2UgeW91ciBwYXRjaCBnZXRzIG1lcmdlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
