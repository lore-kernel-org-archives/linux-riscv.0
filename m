Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAEEC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaTjsfJoUemSGtEAqzovnKLYNuntDUWGJ1GCFrp1kTE=; b=MdwcgfKHermXdJ
	4ajST3nNkiVWxoplWww7Jb8B+r0EJxIEI8RzyKw8JFV1teYhBr9OaJTcFYpTTKVZiE6CXs47G/1Su
	OuisykMpWqxDdfSOFBaieyHCsdYOiuAzzPgScfRyexVQA7xVaww0mRdT8FHIO0qycQBnRuBX+SzXG
	NKYvGzbyGWYzxQAnRo5dvylX/EU7P6mTX9lCEOMQjRBne9H6dYfRr0CKU/nvNXsFq41vnXkWOD9s9
	jL7MNktEeTOhKIA/nD5RPOAUhfLdMbBWpnVT9J9YnBWUEHED05WKonfjf6jLUGDR6eR4DfLZBb9C5
	nU2fyXrrOFs20gOY1TUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyKy-003JvB-7m; Fri, 18 Nov 2022 10:11:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyKu-003JtC-Mv
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 10:11:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id b185so4435098pfb.9
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEtO4CCEimDC+Nu/x59xP/BnLVUUH7IsIaxLuiVF9wI=;
        b=mmP1E48vDI/X6tezRg8p/ZlNubcRrcm4WHeJ7wSSfUF3NYd6AGBizR0AX5Wt/oNkMl
         FHvzd4KGnYL4v8Bd3+N8H3/yJel61rYiPU0e1gQrNlMPJBaRV7yDrlXDbXM/5SsZK1a+
         OI8Q84ZQjc3exqCgsetx/l9ssMFQLebvh56fFwsEjbYIYIXTXUZGMLYzHUbyXPyUkTf9
         mz+FprZXs7gAazbSVn0lTVBHu6+dFsmRJn12EcitUnnupOVjH8Z2B1n5dBDWji3fGXsw
         YaxEHpp3T+ypYNjcQgbcc7n9uoGL8opSU0sGWV2gkT7+e4l5tPK/bQ9xCf/MW64yz23m
         Kslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEtO4CCEimDC+Nu/x59xP/BnLVUUH7IsIaxLuiVF9wI=;
        b=ceUPLiHpCk5yC3oMjEvdhbBoPy6LD7SHPvQnqO67Mshbl+oavPrigiz8smxzsxdHkk
         yep24qzLzdzoa7FE/0Pwl0099Cpxtl722y4EUXd0RpYJZNcpyG+kR9qFYYAP5HULoUct
         KBPYT16U3AVj5WcDV6YPNFy4mxFItNaUeoBFQBS35LMNOqg8mKxaYmNe7UqdWJ7nJKuU
         gpI2+G5krZred4B2FUYYXqouU+bkd/SzkiZPFYo9Mvos/NDykuRT4jCuY/QPuF/X01Jz
         5npy6XaMMWeFQG1ra5DWQ+CyH98xjyLUVmIaBeWocFBij5TNEXac0wwWG35yd/j16nHL
         Ew/Q==
X-Gm-Message-State: ANoB5pmKdK76CYqMqyY1dUP9TVpu1r8sK07PZUOR09Otfh7HGL5OTWIF
	S8jgRJ4Sm7J/zBTuX/xa6+iJmtaOxAVADWrX9X0=
X-Google-Smtp-Source: AA0mqf57B6397TWze0+q8Eft0ytEgpTVA4uXE2s8DlX7b/KXQhKGXAhj8gXafrGehZRzZ6ysmROS5/2jHviaeCMD2do=
X-Received: by 2002:aa7:8a0c:0:b0:56c:2a86:d74 with SMTP id
 m12-20020aa78a0c000000b0056c2a860d74mr7021501pfa.73.1668766263192; Fri, 18
 Nov 2022 02:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20221116031305.286634-1-suagrfillet@gmail.com> <CAJF2gTS0jFkynErVVnQPoqzo-_cWRPRCYZLwRyTpuaxu7NVdWQ@mail.gmail.com>
In-Reply-To: <CAJF2gTS0jFkynErVVnQPoqzo-_cWRPRCYZLwRyTpuaxu7NVdWQ@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Fri, 18 Nov 2022 10:10:00 +0000
Message-ID: <CAAYs2=iW=SOXhT__95ezV_J89wPR_dySLnWgS-dRCMizGJGGcA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] riscv/ftrace: make function graph use ftrace directly
To: Guo Ren <guoren@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_021104_771922_BBA7357C 
X-CRM114-Status: GOOD (  22.55  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDE35pel5ZGo5ZubIDAx
OjQ25YaZ6YGT77yaCj4KPiBJIGhvcGUgdGhpcyBzZXJpZXMgY291bGQgYmFzZSBvbiB0aGUgZm9s
bG93aW5nOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwOTIxMDM0
OTEwLjMxNDI0NjUtNC1ndW9yZW5Aa2VybmVsLm9yZy8KPgo+IFRoZXkgYWxsIG1vZGlmaWVkIHRo
ZSBtY291bnQtZHluLlMuCk9rLCBJJ2xsIGFkYXB0IHRoZXNlIHBhdGNoZXMgYmFzZWQgb24gdGhl
IHNlcmllcyB5b3UgbWVudGlvbmVkLgo+Cj4KPiBPbiBXZWQsIE5vdiAxNiwgMjAyMiBhdCAxMTox
MyBBTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IElu
IFJJU0MtViBhcmNoaXRlY3R1cmUsIHdoZW4gd2UgZW5hYmxlIHRoZSBmdHJhY2VfZ3JhcGggdHJh
Y2VyIG9uIHNvbWUKPiA+IGZ1bmN0aW9ucywgdGhlIGZ1bmN0aW9uIHRyYWNpbmdzIG9uIG90aGVy
IGZ1bmN0aW9ucyB3aWxsIHN1ZmZlciBleHRyYQo+ID4gZ3JhcGggdHJhY2luZyB3b3JrLiBJbiBl
c3NlbmNlLCBncmFwaF9vcHMgaXNuJ3QgbGltaXRlZCBieSBpdHMgZnVuY19oYXNoCj4gPiBkdWUg
dG8gdGhlIGdsb2JhbCBmdHJhY2VfZ3JhcGhfW3JlZ3NdX2NhbGwgbGFiZWwuIFRoYXQgc2hvdWxk
IGJlIGNvcnJlY3RlZC4KPiA+Cj4gPiBXaGF0IGluc3BpcmVzIG1lIGlzIHRoZSBjb21taXQgMGMw
NTkzYjQ1YzliICgieDg2L2Z0cmFjZTogTWFrZSBmdW5jdGlvbgo+ID4gZ3JhcGggdXNlIGZ0cmFj
ZSBkaXJlY3RseSIpIHRoYXQgdXNlcyBncmFwaF9vcHM6OmZ1bmMgZnVuY3Rpb24gdG8gaW5zdGFs
bAo+ID4gcmV0dXJuX2hvb2tlciBhbmQgbWFrZXMgdGhlIGZ1bmN0aW9uIGNhbGxlZCBhZ2FpbnN0
IGl0cyBmdW5jX2hhc2guCj4gPgo+ID4gVGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBtYWtlcyBmdW5j
dGlvbiBncmFwaCB1c2UgZnRyYWNlIGRpcmVjdGx5IGZvciByaXNjdi4KPiA+Cj4gPiBJZiBGVFJB
Q0VfV0lUSF9SRUdTIGlzbid0IGRlZmluZWQsIGZ0cmFjZV9jYWxsZXIga2VlcHMgZnRyYWNlX2dy
YXBoX2NhbGwKPiA+IHNvIHRoYXQgaXQgY2FuIGJlIHJlcGxhY2VkIHdpdGggdGhlIGNhbGxpbmcg
b2YgcHJlcGFyZV9mdHJhY2VfcmV0dXJuIGJ5Cj4gPiB0aGUgZW5hYmxlL2Rpc2FibGUgaGVscGVy
Lgo+ID4KPiA+IEFzIGZvciBkZWZpbmluZyBGVFJBQ0VfV0lUSF9SRUdTLCBmdHJhY2VfY2FsbGVy
IGlzIGFkanVzdGVkIHRvIHNhdmUgdGhlCj4gPiBuZWNlc3NhcnkgcmVncyBhZ2FpbnN0IHRoZSBw
dF9yZWdzIGxheW91dCwgc28gaXQgY2FuIHJlYXNvbmFibHkgY2FsbCB0aGUKPiA+IGdyYXBoX29w
czo6ZnVuYyBmdW5jdGlvbiAtIGZ0cmFjZV9ncmFwaF9mdW5jLiBBbmQgZnRyYWNlX2dyYXBoX1ty
ZWdzXV9jYWxsCj4gPiBhbmQgaXRzIGVuYWJsZS9kaXNhYmxlIGhlbHBlciBhcmVuJ3QgbmVlZGVk
Lgo+ID4KPiA+IFRoZSB0ZXN0cyBnZW5lcmF0ZWQgYnkgQ09ORklHX0ZUUkFDRV9TVEFSVFVQX1RF
U1QgaGF2ZSBwYXNzZWQgaW4gdGhlIGxvY2FsCj4gPiBxZW11LXN5c3RlbS1yaXNjdjY0IHZpcnQg
bWFjaGluZS4gVGhlIGZvbGxvd2luZyBpcyB0aGUgbG9nIGR1cmluZyBzdGFydHVwLgo+ID4KPiA+
IGBgYAo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6IFRlc3RpbmcgdHJhY2VyIGZ1
bmN0aW9uOiBQQVNTRUQKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiBUZXN0aW5n
IGR5bmFtaWMgZnRyYWNlOiBQQVNTRUQKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVs
OiBUZXN0aW5nIGR5bmFtaWMgZnRyYWNlIG9wcyAjMToKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFn
ZTQga2VybmVsOiAoMSAwIDEgMCAwKQo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6
ICgxIDEgMiAwIDApCj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogKDIgMSAzIDAg
MzY1KQo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6ICgyIDIgNCAwIDM5OSkKPiA+
IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiAoMyAyIDQgMCAxNDYwNzEpCj4gPiBOb3Yg
MTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogKDMgMyA1IDAgMTQ2MTA1KSBQQVNTRUQKPiA+IE5v
diAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiBUZXN0aW5nIGR5bmFtaWMgZnRyYWNlIG9wcyAj
MjoKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiAoMSAwIDEgNTg5IDApCj4gPiBO
b3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogKDEgMSAyIDYzNSAwKQo+ID4gTm92IDE1IDAz
OjA3OjEzIHN0YWdlNCBrZXJuZWw6ICgyIDEgMyAxIDIpCj4gPiBOb3YgMTUgMDM6MDc6MTMgc3Rh
Z2U0IGtlcm5lbDogKDIgMiA0IDEyNSAxMjYpCj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtl
cm5lbDogKDMgMiA0IDE0NjAwMSAxNDYwNzgpCj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtl
cm5lbDogKDMgMyA1IDE0NjAzNSAxNDYxMTIpIFBBU1NFRAo+ID4gTm92IDE1IDAzOjA3OjEzIHN0
YWdlNCBrZXJuZWw6IFRlc3RpbmcgZnRyYWNlIHJlY3Vyc2lvbjogUEFTU0VECj4gPiBOb3YgMTUg
MDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogVGVzdGluZyBmdHJhY2UgcmVjdXJzaW9uIHNhZmU6IFBB
U1NFRAo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6IFRlc3RpbmcgZnRyYWNlIHJl
Z3M6IFBBU1NFRAo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6IFRlc3RpbmcgdHJh
Y2VyIG5vcDogUEFTU0VECj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogVGVzdGlu
ZyB0cmFjZXIgaXJxc29mZjogUEFTU0VECj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5l
bDogVGVzdGluZyB0cmFjZXIgd2FrZXVwOgo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJu
ZWw6IHNjaGVkOiBETCByZXBsZW5pc2ggbGFnZ2VkIHRvbyBtdWNoCj4gPiBOb3YgMTUgMDM6MDc6
MTMgc3RhZ2U0IGtlcm5lbDogUEFTU0VECj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5l
bDogVGVzdGluZyB0cmFjZXIgd2FrZXVwX3J0OiBQQVNTRUQKPiA+IE5vdiAxNSAwMzowNzoxMyBz
dGFnZTQga2VybmVsOiBUZXN0aW5nIHRyYWNlciB3YWtldXBfZGw6IFBBU1NFRAo+ID4gTm92IDE1
IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6IFRlc3RpbmcgdHJhY2VyIGZ1bmN0aW9uX2dyYXBoOiBQ
QVNTRUQKPiA+IGBgYAo+ID4KPiA+IE5vdGUgdGhhdCB0aGUgY2hhbmdlcyBvZiBtY291bnQtZHlu
LlMgY29uZmxpY3RzIHdpdGggdGhpcyB1bm1lcmdlZAo+ID4gY29tbWl0IChyaXNjdjogZW50cnk6
IGNvbnNvbGlkYXRlIGdlbmVyYWwgcmVncyBzYXZpbmcvcmVzdG9yaW5nKS4KPiA+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIxMTAzMDc1MDQ3LjE2MzQ5MjMtMTUtZ3Vv
cmVuQGtlcm5lbC5vcmcKPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYxCj4gPiAtICBmaXhlZCB0aGUg
Y2hlY2twYXRjaCB3YXJuaW5ncyBpbiBwYXRjaCAxCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDIyMTExNTA2MTUyNS4xMTI3NTctMS1zdWFncmZpbGxldEBn
bWFpbC5jb20KPiA+Cj4gPiBTb25nIFNodWFpICgzKToKPiA+ICAgcmlzY3YvZnRyYWNlOiBhZGQg
ZnRyYWNlX2dyYXBoX2Z1bmMKPiA+ICAgcmlzY3YvZnRyYWNlOiBTQVZFX0FMTCBzdXBwb3J0cyBs
aWdodHdlaWdodCBzYXZlCj4gPiAgIHJpc2N2L2Z0cmFjZTogY2xlYW51cCBmdHJhY2VfY2FsbGVy
IGFuZCBmdHJhY2VfcmVnc19jYWxsZXIKPiA+Cj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9m
dHJhY2UuaCB8ICAxMyArKy0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyAgICAgIHwg
IDM1ICsrKystLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TICB8IDE0NSAr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTM2
IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAyLjIwLjEKPiA+
Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KClRoYW5rcywKU29uZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
