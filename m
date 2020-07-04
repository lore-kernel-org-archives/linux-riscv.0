Return-Path: <SRS0=1yfy=AP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB1FC433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 14:55:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFDBC21707
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 14:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2BaZ0CB/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3eSMm59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFDBC21707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HGQ+7HlaKGcbJO/ifSwkRvnOXWHIiKs2yoId6tfpE4Q=; b=2BaZ0CB/AWx9AteRL1u8Ke+E9
	9JNfEUDIlUnjZ+OgTDFVxtHB2FFKopJMIQ7AbBw5JIjm5eiiHotDB/genc801lVz1AeSmrXcsInts
	9MYvQ35KDJh9G2+o2FpJtki7kkTZe79CjsZyv3FxgK+RK43t41eXcNXw31rdw3zJsJEBwGxdiOkjI
	YCYlHslCnssw8Zl7R7A8hMxU1Yuc7kb7/IbDQUQn136wYJaqEww3jIiJmOBgrjmTlOAMBDGy1tPG0
	l38yFQq3nhBs8p/NRXusNNHcfPY0tX5a3hNF5WJs0Cg7KbZFO3FKATYpGB1KMUyD62rziieqTgZEW
	QhCBsfd0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrja0-0004EA-4K; Sat, 04 Jul 2020 14:55:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrjZx-0004DG-6z
 for linux-riscv@lists.infradead.org; Sat, 04 Jul 2020 14:55:46 +0000
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E340D2070C
 for <linux-riscv@lists.infradead.org>; Sat,  4 Jul 2020 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593874542;
 bh=ojbgQmjPTV7D6kXqc4BTRRhR75bviWgGGtdXVdf+q9I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y3eSMm59oP8v1iEQ7GYqolbPktucp14jR0nXZszhUE2dTmzXPf35N2IOz91wo8Mcb
 NnXjhBNvxqNPDHdG0mD6FLIiRVM4jtRN2rFAjqBvRz+w1k1J9cVer/BrWEzNCuYFGi
 R2l9SCKG5o2CfKIQ0NcKo8VAYaUVPaMRsq/J44h0=
Received: by mail-lj1-f175.google.com with SMTP id z24so15342189ljn.8
 for <linux-riscv@lists.infradead.org>; Sat, 04 Jul 2020 07:55:41 -0700 (PDT)
X-Gm-Message-State: AOAM533DIxZd+X+p4ltqZEYgh1V5AHW+3CuGZG5Xhr0wwfDGS1+OWQmB
 zpXqSAxkcZ8krExswd0253dlxhyF5RF1Y7jsjNY=
X-Google-Smtp-Source: ABdhPJzIk1tCgJjz4OUWhVlitpIkUcsZm9HDMIiZYK03ivVBzcTjfWnBMrpv0O6qL9pOvJGS1ty5yLoysAERVwX8Y94=
X-Received: by 2002:a05:651c:2da:: with SMTP id
 f26mr21209299ljo.377.1593874540221; 
 Sat, 04 Jul 2020 07:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <1593833659-26224-1-git-send-email-guoren@kernel.org>
 <CAOJsxLFF4o8AFWzPFJgwaeuA=Lb9VsjMXXfVmbhZBwLPcG=Asg@mail.gmail.com>
In-Reply-To: <CAOJsxLFF4o8AFWzPFJgwaeuA=Lb9VsjMXXfVmbhZBwLPcG=Asg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 4 Jul 2020 22:55:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSYyj5rTUJW-yDDrrV7T3hUssAhGc0gnCntcQpuixNJzw@mail.gmail.com>
Message-ID: <CAJF2gTSYyj5rTUJW-yDDrrV7T3hUssAhGc0gnCntcQpuixNJzw@mail.gmail.com>
Subject: Re: [PATCH V1 0/5] riscv: Add k/uprobe supported
To: Pekka Enberg <penberg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_105545_500547_580E02AF 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, bjorn.topel@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGVra2EsCgpPbiBTYXQsIEp1bCA0LCAyMDIwIGF0IDI6NDAgUE0gUGVra2EgRW5iZXJnIDxw
ZW5iZXJnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEp1bCA0LCAyMDIwIGF0IDY6MzQg
QU0gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+IFRoZSBwYXRjaHNldCBpbmNsdWRlcyBr
cHJvYmUvdXByb2JlIHN1cHBvcnQgYW5kIHNvbWUgcmVsYXRlZCBmaXh1cHMuCj4KPiBOaWNlIQo+
Cj4gT24gU2F0LCBKdWwgNCwgMjAyMCBhdCA2OjM0IEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiBUaGVyZSBpcyBubyBzaW5nbGUgc3RlcCBleGNlcHRpb24gaW4gcmlzY3YgSVNBLCBz
byB1dGlsaXplIGVicmVhayB0bwo+ID4gc2ltdWxhdGUuIFNvbWUgcGMgcmVsYXRlZCBpbnN0cnVj
dGlvbnMgY291bGRuJ3QgYmUgZXhlY3V0ZWQgb3V0IG9mIGxpbmUKPiA+IGFuZCBzb21lIHN5c3Rl
bS9mZW5jZSBpbnN0cnVjdGlvbnMgY291bGRuJ3QgYmUgYSB0cmFjZSBzaXRlIGF0IGFsbC4KPiA+
IFNvIHdlIGdpdmUgb3V0IGEgcmVqZWN0IGxpc3QgYW5kIHNpbXVsYXRlIGxpc3QgaW4gZGVjb2Rl
LWluc24uYy4KPgo+IENhbiB5b3UgZWxhYm9yYXRlIG9uIHdoYXQgeW91IG1lYW4gYnkgdGhpcz8g
V2h5IHdvdWxkIHlvdSBuZWVkIGEKPiBzaW5nbGUtc3RlcCBmYWNpbGl0eSBmb3Iga3Byb2Jlcz8g
SXMgaXQgZm9yIGV4ZWN1dGluZyB0aGUgaW5zdHJ1Y3Rpb24KPiB0aGF0IHdhcyByZXBsYWNlZCB3
aXRoIGEgcHJvYmUgYnJlYWtwb2ludD8KCkl0J3MgdGhlIHNpbmdsZS1zdGVwIGV4Y2VwdGlvbiwg
bm90IHNpbmdsZS1zdGVwIGZhY2lsaXR5IQoKT3RoZXIgYXJjaGVzIHVzZSBoYXJkd2FyZSBzaW5n
bGUtc3RlcCBleGNlcHRpb24gZm9yIGsvdXByb2JlLCAgZWc6CiAtIHBvd2VycGM6IHJlZ3MtPm1z
ciB8PSBNU1JfU0lOR0xFU1RFUAogLSBhcm0vYXJtNjQ6IFBTVEFURS5EIGZvciBlbmFibGluZyBz
b2Z0d2FyZSBzdGVwIGV4Y2VwdGlvbnMKIC0gczM5MDogU2V0IFBFUiBjb250cm9sIHJlZ3MsIHR1
cm5zIG9uIHNpbmdsZSBzdGVwIGZvciB0aGUgZ2l2ZW4gYWRkcmVzcwogLSB4ODY6IHJlZ3MtPmZs
YWdzIHw9IFg4Nl9FRkxBR1NfVEYKIC0gY3NreTogb2YgY291cnNlIHVzZSBodyBzaW5nbGUgc3Rl
cCA6KQoKWWVzLCBBbGwgdGhlIGFib3ZlIGFyY2hlcyB1c2UgYSBoYXJkd2FyZSBzaW5nbGUtc3Rl
cCBleGNlcHRpb24KbWVjaGFuaXNtIHRvIGV4ZWN1dGUgdGhlIGluc3RydWN0aW9uIHRoYXQgd2Fz
IHJlcGxhY2VkIHdpdGggYSBwcm9iZQpicmVha3BvaW50LgoKPgo+IEFsc28sIHRoZSAiRGVidWcg
U3BlY2lmaWNhdGlvbiIgWzFdIHNwZWNpZmllcyBhIHNpbmdsZS1zdGVwIGZhY2lsaXR5Cj4gZm9y
IFJJU0MtViAtLSB3aHkgaXMgdGhhdCBub3QgdXNlZnVsIGZvciBpbXBsZW1lbnRpbmcga3Byb2Jl
cz8KPgo+IDEuIGh0dHBzOi8vcmlzY3Yub3JnL3NwZWNpZmljYXRpb25zL2RlYnVnLXNwZWNpZmlj
YXRpb24vCldlIG5lZWQgc2luZ2xlLXN0ZXAgZXhjZXB0aW9uIG5vdCBzaW5nbGUtc3RlcCBieSBq
dGFnLCBzbyBhYm92ZSBzcGVjCmlzIG5vdCByZWxhdGVkIHRvIHRoZSBwYXRjaHNldC4KClNlZSBy
aXNjdi1Qcml2aWxlZ2VkIHNwZWM6CgpJbnRlcnJ1cHQgRXhjZXB0aW9uIENvZGUtRGVzY3JpcHRp
b24KMSAwIFJlc2VydmVkCjEgMSBTdXBlcnZpc29yIHNvZnR3YXJlIGludGVycnVwdAoxIDLigJM0
IFJlc2VydmVkCjEgNSBTdXBlcnZpc29yIHRpbWVyIGludGVycnVwdAoxIDbigJM4IFJlc2VydmVk
CjEgOSBTdXBlcnZpc29yIGV4dGVybmFsIGludGVycnVwdAoxIDEw4oCTMTUgUmVzZXJ2ZWQKMSDi
iaUxNiBBdmFpbGFibGUgZm9yIHBsYXRmb3JtIHVzZQowIDAgSW5zdHJ1Y3Rpb24gYWRkcmVzcyBt
aXNhbGlnbmVkCjAgMSBJbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQKMCAyIElsbGVnYWwgaW5zdHJ1
Y3Rpb24KMCAzIEJyZWFrcG9pbnQKMCA0IExvYWQgYWRkcmVzcyBtaXNhbGlnbmVkCjAgNSBMb2Fk
IGFjY2VzcyBmYXVsdAowIDYgU3RvcmUvQU1PIGFkZHJlc3MgbWlzYWxpZ25lZAowIDcgU3RvcmUv
QU1PIGFjY2VzcyBmYXVsdAowIDggRW52aXJvbm1lbnQgY2FsbCBmcm9tIFUtbW9kZQowIDkgRW52
aXJvbm1lbnQgY2FsbCBmcm9tIFMtbW9kZQowIDEw4oCTMTEgUmVzZXJ2ZWQKMCAxMiBJbnN0cnVj
dGlvbiBwYWdlIGZhdWx0CjAgMTMgTG9hZCBwYWdlIGZhdWx0CjAgMTQgUmVzZXJ2ZWQKMCAxNSBT
dG9yZS9BTU8gcGFnZSBmYXVsdAowIDE24oCTMjMgUmVzZXJ2ZWQKMCAyNOKAkzMxIEF2YWlsYWJs
ZSBmb3IgY3VzdG9tIHVzZQowIDMy4oCTNDcgUmVzZXJ2ZWQKMCA0OOKAkzYzIEF2YWlsYWJsZSBm
b3IgY3VzdG9tIHVzZQowIOKJpTY0IFJlc2VydmVkCgpObyBzaW5nbGUgc3RlcCEKClNvIEkgaW5z
ZXJ0IGEgImVicmVhayIgaW5zdHJ1Y3Rpb24gYmVoaW5kIHRoZSB0YXJnZXQgc2luZ2xlLXN0ZXAK
aW5zdHJ1Y3Rpb24gdG8gc2ltdWxhdGUgdGhlIHNhbWUgbWVjaGFuaXNtLgoKLS0gCkJlc3QgUmVn
YXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
