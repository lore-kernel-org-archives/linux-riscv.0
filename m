Return-Path: <SRS0=4NHM=NW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6F2C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 07:15:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD1D220872
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 07:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BEhNWClb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="25yM5842";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="PPOdqUaN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD1D220872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG/9f7ajvKx/SjO/FIDNuFYaWVN87iLA4uqJQY71mRs=; b=BEhNWClbbV1JUG
	ZSAwlQaO3F2KAL88K+Nv/4L7Z+jKWc7aqlagKtFB3iSEvqOLBPyr+VDBEDdr8ZD37HEztvTA8iqCR
	7POwIixE7gs5K+bj2U2yzjEtg9r7+5sjIWiOELpRslCoFZ58vnxyfimm5HjQYEjQjWMIOSvRhFcOZ
	UxDTFvrvTTZnQSumaxeMXew/GkmCImoySlFuxHoFDOOpCNXoJf19wQ70x+dnyrQtnNPPXszPabo5I
	Vsm7La3sfJDcnXv7Dx/XYnV/0M6hM8Je71VNxVgasfsjR8ojFxib2sDEI59+gwYVPIn+9gVtt/Pzl
	LHTecWO6LfLmEd3Y2gvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLjy7-0002n2-AC; Sun, 11 Nov 2018 07:15:39 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLjy5-0002mv-GL
 for linux-riscv@bombadil.infradead.org; Sun, 11 Nov 2018 07:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dtTL17G/nUQDl74uKdeTbwkcusDf6UHCl3ch1o+nORQ=; b=25yM5842VnH4VM2TN5EA2WfkG/
 J17/cQrw5QvxCTuM6D9vNu1A30YRL13LGVA/SWg8s3EdwqCTHhU8D9hx11AVxaIfFG3Ysh25lku6p
 lFNvdLI1PkDgHWJ6jzSaQXxcj2y+hl9PEACQnrbopTz2jX0/oUomss2/y9fG3NQo88y0CxuVof5Lz
 IGJqRCxFdAhVFVC0imhpjlkjSy1c/1X9HwmzC2ilH802eYg9jjzGupVGAvSpONh5WvfFUzGzTo4iM
 WoUsia5FpbdrCUzVh4WRxebGAg+CJHQWt55jSzCz9CH/YCX9ivYuLrOzTe/WDtON3zI9czp4MvkLu
 bGtyHbow==;
Received: from lkcl.net ([217.147.94.29])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLjy1-0004Do-Qp
 for linux-riscv@lists.infradead.org; Sun, 11 Nov 2018 07:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=dtTL17G/nUQDl74uKdeTbwkcusDf6UHCl3ch1o+nORQ=; 
 b=PPOdqUaNnIYQcTliaZ8GpU0gmqmYZlk1axBIngOeGk/8mXYLxQV5kDnIPrEFiFgHgqFwtgAErz2MShIFmEshYDekTes8E+GWwEQRPvmMAoSnd404cE0JMoJLjo290bKl5vRr1WTenKbkwiCHfInAdJgI3vCioGX+cijN191hrLg=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLjxm-00058f-Jz
 for linux-riscv@lists.infradead.org; Sun, 11 Nov 2018 07:15:18 +0000
Received: by mail-lf1-f53.google.com with SMTP id v5so4065283lfe.7
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 23:14:58 -0800 (PST)
X-Gm-Message-State: AGRZ1gKxdQj9fVJ0BgSh8KTTuJRaF4mItP0YOG/j76Ewafs9rhwoaMMa
 J9ifA1KFy3PmkcWZFpRBgh39Sns/6jMDumckpYQ=
X-Google-Smtp-Source: AJdET5e9bFJPqaZGCcZJqIk04cg4FSunO5nvC7jCMaO6XVHktqjrQ7Ez6Xqx86j6+qwAtvqUR16dAH7eMiSXLsPN3JM=
X-Received: by 2002:a19:cec8:: with SMTP id e191mr8573891lfg.13.1541920492259; 
 Sat, 10 Nov 2018 23:14:52 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
 <CAPweEDxzkNTGKbitReqUqpsybF3ZAZSL4StVjxfkB956gYSPcw@mail.gmail.com>
 <ee0d847efd9d9d4bc1a54e4474d9bf0c@mailhost.ics.forth.gr>
In-Reply-To: <ee0d847efd9d9d4bc1a54e4474d9bf0c@mailhost.ics.forth.gr>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sun, 11 Nov 2018 07:14:40 +0000
X-Gmail-Original-Message-ID: <CAPweEDwYRzuuZVvPrDbUcBxCLcpOoR4tfH=9dQDJuwu0Za=nRA@mail.gmail.com>
Message-ID:
 <CAPweEDwYRzuuZVvPrDbUcBxCLcpOoR4tfH=9dQDJuwu0Za=nRA@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: mick@ics.forth.gr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_021534_223663_7A08EE34 
X-CRM114-Status: GOOD (  33.81  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, Olof Johansson <olof@lixom.net>,
 Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181111071440.ng9DtyMsQdt0FxF12cLO4dYTQ6IG2V_0Gg38AJPo6Xk@z>

LS0tCmNyb3dkLWZ1bmRlZCBlY28tY29uc2Npb3VzIGhhcmR3YXJlOiBodHRwczovL3d3dy5jcm93
ZHN1cHBseS5jb20vZW9tYTY4CgpPbiBTdW4sIE5vdiAxMSwgMjAxOCBhdCAzOjE1IEFNIE5pY2sg
S29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAxOC0x
MS0xMCAyMTozOSwgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDOrc6zz4HOsc+IzrU6Cj4g
PiAtLS0KPiA+IGNyb3dkLWZ1bmRlZCBlY28tY29uc2Npb3VzIGhhcmR3YXJlOiBodHRwczovL3d3
dy5jcm93ZHN1cHBseS5jb20vZW9tYTY4Cj4gPgo+ID4gT24gU2F0LCBOb3YgMTAsIDIwMTggYXQg
NTo1OSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+ID4gd3JvdGU6Cj4g
Pj4KPiA+PiDOo8+EzrnPgiAyMDE4LTExLTEwIDE5OjQ3LCBMdWtlIEtlbm5ldGggQ2Fzc29uIExl
aWdodG9uIM6tzrPPgc6xz4jOtToKPiA+PiA+IE9uIFNhdCwgTm92IDEwLCAyMDE4IGF0IDU6NDIg
UE0gT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4b20ubmV0PiB3cm90ZToKPiA+PiA+Cj4gPj4gPj4g
VGhlIGNhc2Ugb2YgY29uc29sZSBpcyBpbiB0aGlzIGNhc2UgcHJldHR5IHNpbXBsZTogSXQncyBp
bnRlbmRlZCBmb3IKPiA+PiA+PiBlYXJseSBib290IGZvciB2ZXJ5IHNpbXBsaXN0aWMgZW52aXJv
bm1lbnRzIChiZWZvcmUgdGhlIHJlc3Qgb2YgdGhlCj4gPj4gPj4ga2VybmVsIGlzIHVwLCBldGMp
LiBLZWVwaW5nIHRoZSBTQkkgY29uc29sZSBhcm91bmQgYmV5b25kIGVhcmx5IGJvb3QsCj4gPj4g
Pj4gYW5kIHNvbWVob3cgdHJ5aW5nIHRvIG9wdGltaXplIGZvciBpdCBmb3IgdGhvc2UgdXNlIGNh
c2VzIGlzIGEKPiA+PiA+PiBtaXNkaXJlY3RlZCBlZmZvcnQ7IHRoYXQncyB3aGF0IG5hdGl2ZSBk
cml2ZXJzIGFyZSBmb3IuCj4gPj4gPgo+ID4+ID4gIHNwaWtlICh3aGljaCBpcyBvbmx5IGFyb3Vu
ZCA3LDAwMCBsaW5lcyBvZiBjb2RlKSBkb2Vzbid0IGhhdmUgbmF0aXZlCj4gPj4gPiBkcml2ZXJz
LCBhbmQgcWVtdSBpcyB0b28gaGVhdnktZHV0eSB0byBjb25zaWRlciBhZGRpbmcgY3VzdG9tCj4g
Pj4gPiBleHRlbnNpb25zIGFuZCBleHBlcmltZW50YWwgcmVzZWFyY2ggb250by4KPiA+PiA+Cj4g
Pj4gPiAgd2l0aCBub3RoaW5nIGluIHNwaWtlICpvdGhlciogdGhhbiB0aGUgc2VyaWFsIGNvbnNv
bGUsIGl0J3MgdGhlIG9ubHkKPiA+PiA+IHdheSBpbiBhbmQgb3V0Lgo+ID4+ID4KPiA+PiA+ICBs
Lgo+ID4+Cj4gPj4gQW55dGhpbmcgbW9yZSB0aGFuIGEgbWFpbi9kZWJ1ZyBjb25zb2xlIGlzIHRv
byBtdWNoIGZvciB0aGUgU0JJLCBpdHMKPiA+PiBnb2FsIGlzIHRvIGJlIHVzZWQgZWFybHkgb24g
aW4gdGhlIGJvb3QgcHJvY2VzcyB1bnRpbCB0aGUgT1Mgb3IgdGhlCj4gPj4gYmFyZSBtZXRhbCBh
cHAgdGFrZXMgY29udHJvbC4KPiA+Cj4gPiAgbm9vbywgdGhhdCdzIGp1c3QgX29uZV8gdXNlIHRv
IHdoaWNoIGl0J3MgYmVpbmcgcHV0Lgo+ID4KPiA+PiBIYXZpbmcgbXVsdGlwbGUgc2VyaWFsIGxp
bmVzIHRocm91Z2gKPiA+PiB0aGUgU0JJIGZvciB0aGluZ3MgbGlrZSBQUFAsIFVQUywgdmlydHVh
bCBjb25zb2xlcyBhbmQgYWxsIHRoZSBzdHVmZgo+ID4+IHlvdSBtZW50aW9uZWQgaXMgb3V0IG9m
IHNjb3BlLgo+ID4KPiA+ICB3aHk/Cj4gPgo+Cj4gQmVjYXVzZSB0aGUgZmlybXdhcmUgaXMgbWVh
bnQgdG8gYmUgc29tZXRoaW5nIG1pbmltYWwsIG5vdCB0byByZXBsYWNlCj4gdGhlCj4gT1MuIExl
dCBtZSBhc2sgeW91IHRoaXMsIGlmIHlvdSB3YW50IHRvIGNoYW5nZSBVQVJUIHNwZWVkIG9yIHNl
dHRpbmdzIGluCj4gZ2VuZXJhbCB3b3VsZCB5b3UgYWxzbyBhc2sgZm9yIGFuIFNCSSBjYWxsIGZv
ciB0aGF0ID8KCiBvZiBjb3Vyc2UsIG5vdCwgbmljay4gIGl0J3MgYSBzaW1wbGUgY3V0L3Bhc3Rl
IG9mIHRoZSBleGlzdGluZwpjb25zb2xlIGdldGNoYXIvcHV0Y2hhciBjb2RlLiAgeW91J3JlIGJl
Z2lubmluZyB0byBhbGFybSBtZSBieSBtYWtpbmcKdGhpcyBvdXQgdG8gYmUgbXVjaCBtb3JlIGNv
bXBsZXggdGhhbiBpdCBpcy4KCiBpZiBpJ2QgdGhvdWdodCBpdCB3YXMgYSBnb29kIGlkZWEgdG8g
cHJvcG9zZSBhbiBTQkkgY2FsbCB0byBjaGFuZ2UKVUFSVCBzcGVlZCBvciBzZXR0aW5ncywgaSB3
b3VsZCBoYXZlIHNhaWQgc28uICB0aGVyZSdzIGFic29sdXRlbHkgbm8KbmVlZCB0byBtYWtlIGl0
ICpsb29rKiBsaWtlIGkndmUgcHJvcG9zZWQgdGhhdC4gIGRvaW5nIHNvIC0gcHV0dGluZwp3b3Jk
cyBpbnRvIHNvbWVvbmUgZWxzZSdzIG1vdXRoIC0gaXMgdW5ldGhpY2FsLCBhbmQgaSdkIGFwcHJl
Y2lhdGUgaXQKaWYgeW91IGNvdWxkIHN0b3AgZG9pbmcgaXQuCgoKPiBXaGF0J3MgY29taW5nIHVw
IG5leHQgPwoKIG5vdGhpbmcsIG5pY2suICBqdXN0IG9uZSBleHRyYSBwYXJhbWV0ZXIgdG8gdGhl
IGNvbnNvbGUKZ2V0Y2hhci9wdXRjaGFyIGZ1bmN0aW9uIFtvciBhIGR1cGxpY2F0ZSBmdW5jdGlv
biB3aGljaCBkb2VzXSB0aGF0J3MKYWxsLgoKPiBBZGRpbmcgbmV0d29ya2luZyBzdXBwb3J0IGZv
ciBleGFtcGxlID8KCiBvZiBjb3Vyc2Ugbm90LiAgd2h5IG9uIGVhcnRoIHdvdWxkIHRoYXQgbWFr
ZSBzZW5zZT8gIGhvdyBvbiBlYXJ0aAp3b3VsZCBuZXR3b3JraW5nIGZpdCBpbnRvIGEgMTZrIEJv
b3QgUk9NPwoKIGkgZmVlbCB0aGF0IHlvdSdyZSBhcmd1aW5nIGFuZCB0aHJvd2luZyB1cCBzdHJh
dy1tYW4gcXVlc3Rpb25zIGZvcgphcmd1bWVudHMnIHNha2UsIGhlcmUsIGhvcGluZyB0aGF0IG9u
ZSBvZiB0aGVtIHdpbGwgc3RpY2ssIGFuZCB0aGF0IGJ5Cmlnbm9yaW5nIHRoZSBwb3NpdGl2ZSBh
c3BlY3RzIG9mIHRoZSAoaW5jcmVkaWJseSBzaW1wbGUpCmN1dC9wYXN0ZS1zdHlsZSBtaW5pbWFs
aXN0IHByb3Bvc2FsIGFuZCB0aHJvd2luZyBhcyBtYW55ICJiYWQiIG9uZXMKb3V0IHRoZXJlLCBp
dCdsbCBzb21laG93Li4gZG8uLiBpIGR1bm5vLCB3aGF0ICppcyogdGhlIHB1cnBvc2Ugb2YgdGhl
CnF1ZXN0aW9ucyB5b3UncmUgYXNraW5nPwoKCj4gV2hlcmUgZG8geW91IHB1dCB0aGUKPiBiYXJy
aWVyCj4gb24gZmlybXdhcmUncyBjb21wbGV4aXR5IC8gc2NvcGUgPwoKIGF0IHRoZSBleGFjdCBz
YW1lIHBvaW50IHRoYXQgeW91IGRvLCB1bmRlciB0aGUgY2lyY3Vtc3RhbmNlcyBhbmQKY29udGV4
dCBpbiB3aGljaCB5b3UncmUgbG9va2luZyBhdCBhbmQgZnJvbS4KCiBub3csIGNhbiB5b3UgcmVj
b2duaXNlIHRoYXQgdGhlcmUgYXJlICpvdGhlciogbmVlZHMgYW5kIHJlcXVpcmVtZW50cwphcyB3
ZWxsLCBiZXlvbmQgdGhlIG9uZXMgdGhhdCB5b3UgaGF2ZT8KCj4gQnkgdGhlIHdheSBzcGlrZSBp
cyBhbiBJU0Egc2ltdWxhdG9yLCBJIGRvbid0IHNlZSB3aHkgaXQgc2hvdWxkIGVtdWxhdGUKPiBV
QVJUIHBvcnRzLCBsYXN0IHRpbWUgSSBjaGVja2VkIGl0IGRpZG4ndCwKCiBhaCwgbmljaywgaSBn
ZXQgdGhlIGZlZWxpbmcgeW91J3JlIGRlbGliZXJhdGVseSBsb29raW5nIGZvciB3YXlzIHRvCmJl
IG9ic3RydWN0aXZlLCBhbmQgYWxzbyBmdW5kYW1lbnRhbGx5IG1pc3VuZGVyc3RhbmRpbmcgaG93
IHRoZQpnZXRjaGFyIC8gcHV0Y2hhciBjb2RlIHdvcmtzLgoKIHNwaWtlIHByb3ZpZGVzIGEgbWlu
aW1hbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgU0JJLCB2aWEgbGliZmVzdnIuCnRoZSBkYXRhIHRo
YXQgZ29lcyB0byB0aGUgZ2V0Y2hhci9wdXRjaGFyIGZ1bmN0aW9uIGlzIHVsdGltYXRlbHkKcmVk
aXJlY3RlZCB0byBhIG1pbmltYWxpc3Qgc3RkaW4gLyBzdGRvdXQgaW1wbGVtZW50YXRpb24uICB0
aGVyZSAqaXMqCm5vIGNhbGwgdG8gVUFSVCBwb3J0cy4KCiBjb21lIG9uLCBtYW4sIGJlIGEgbGl0
dGxlIGxlc3MgYWR2ZXJzYXJpYWw6IGl0IG1ha2VzIGxpZmUgZWFzaWVyIGZvciBldmVyeW9uZS4K
Cgo+IHNvIHNvbWVvbmUgd2lsbCBuZWVkIHRvIHdyaXRlCj4gY29kZSBmb3IgdGhhdCwgbW9yZSBt
b25leSAhCgogaSdsbCBoYXBwaWx5IGRvIGl0LCBhcyBpIG5lZWQgaXQuICBpdCdzIGEgc3RyYWln
aHQgY3V0L3Bhc3RlIG9mCnByZS1leGlzdGluZyBjb2RlLgoKPiBZb3UgY2FuIHVzZSBRRU1VIGZv
ciB0aGF0IHdoZXJlIHlvdSBjYW4gaGF2ZQo+IGFzIG1hbnkgVUFSVHMgYXMgeW91IHdhbnQgYW5k
IHRoZSBkcml2ZXJzIGZvciB0aGVtIGFyZSBhbHJlYWR5IGF2YWlsYWJsZQo+IGZvciB5b3UuCgog
aSAqY2FuJ3QqLiAgcWVtdSBpcyB0b28gY29tcGxleCBhbmQgaSd2ZSBpbnZlc3RlZCAyIG1vbnRo
cyBvZgpwZXJzb25hbCBtb25leSAtIHdpdGhvdXQgZnVuZGluZyBvciBncmFudHMgZnJvbSBhbnkg
Y29ycG9yYXRpb24gb3IKaW5zdGl0dXRpb24gLSBpbnRvIHNwaWtlLCBwcmVjaXNlbHkgYmVjYXVz
ZSBpdCdzIG9ubHkgNywwMDAgbGluZXMgb2YKY29kZS4KCiBtb2RpZnlpbmcgcWVtdSBpcyB0b28g
bXVjaC4gIGkndmUgc2VlbiBzaWducyB0aGF0IHRoZXkncmUgbW92aW5nIGludG8KSklUIG9wdGlt
aXNhdGlvbiB0ZXJyaXRvcnksIHdoaWNoIGlzIGZhciB0b28gY29tcGxleCB0byBnZXQgaW52b2x2
ZWQKd2l0aC4KCnNwaWtlIGlzIHNpbXBsZSwgaXQncyBzdHJhaWdodGZvcndhcmQsIGl0J3MgZmFz
dCwgYW5kIGl0IHdvcmtzLgoKCj4gPiAgaSdtIGFuIGV0aGljYWwgbGlicmUgZGV2ZWxvcGVyOiBp
IGNhbid0IGdvIGZvb3RpbmcgdGhlIGJpbGwgZm9yIG90aGVyCj4gPiBwZW9wbGUgdG8gc3Bvbmdl
IG9mZiBteSBlZmZvcnRzIGFsbCB0aGUgdGltZSwgaSd2ZSBoYWQgMjAgeWVhcnMgb2YKPiA+IHBl
b3BsZSBkb2luZyB0aGF0IGFuZCBpJ20gZioqKioqZyB3ZWxsIG5vdCBwdXR0aW5nIHVwIHdpdGgg
aXQgb24gdGhpcwo+ID4gcHJvamVjdC4KPiA+Cj4gPiAgc28gbm8sIG1pY2ssIHNvcnJ5LCBub3Qg
YnV5aW5nIHRoZSBhcmd1bWVudCAiaXQncyBvcGVuIHNvdXJjZSIuCj4gPgo+ID4gbC4KPgo+IERv
bid0IGFzc3VtZSB5b3UgYXJlIHRoZSBvbmx5IG9uZS4KCiBnb29kIHRvIGhlYXIuCgpub3cuLi4g
Y2FuIGkgYXNrIHlvdSBpZiB5b3UgY291bGQgcG9zc2libHkgdHVybiBkb3duIHRoZSBhZHZlcnNh
cmlhbApzdHJhdy1tYW4gdGhpbmcganVzdCBhIGxlZWVldGxlIHRpbnkgYml0PyAgaXQgdGFrZXMg
YSBodWdlIGFtb3VudCBvZgplZmZvcnQgb24geW91ciBwYXJ0IHRvIG1haW50YWluLCBhbmQgbWFr
ZXMgaXQgcmVhbGx5IHJlYWxseSBkaWZmaWN1bHQKZm9yIGV2ZXJ5b25lIHRvIGhhdmUgdG8gcmVh
ZCwgIm5vLCB0aGF0J3Mgbm90IHJpZ2h0LCBubywgdGhhdCdzIG5vdAp0cnVlIGVpdGhlciwgbm8s
IGkgZGlkbid0IHNheSB0aGF0IGF0IGFsbCIgYW5kIHNvIG9uLgoKd2hhdCBkbyB5b3UgdGhpbms/
CgoKbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
