Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC067FD7F90
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nujF6YZBHGeHGDrkoRoFMDuO3r5m6E9u2qCf6sgT/rI=; b=qxEegswTQqxcud
	K7ipPRur57ciCalDE5LkzLrS6jH0jNxb0xtQBFL0ofE/4YEZldn0zZwgwZsxfEDqvruUtiEMf41vj
	4KyHQ4UpBpGWlkciXs8wMJ9NIm33cqlPATMyp1R0VZVWs1Rh0IxZSFP05WN4xUhbz6P1QhHR/LGLA
	vCiFccOmc5ABnJh5OPIfbaFNA+KrESe4aSVMZNle3MPt85ZZNx9OzJYtF7MiEZ0wgkMuuU9ekqfaG
	fjHagXmcWwYCW7gF5O9IUh6pPV2DKp475S+HpbylEWAkRqFARzpW+Ikicoyjpss5F8PI9QMUPOL6Y
	ZJgI26K2jfiWkBElmbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvVR-00000008GDe-17tZ;
	Fri, 27 Feb 2026 10:55:37 +0000
Received: from mout.perfora.net ([74.208.4.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvVN-00000008GDH-3dGx
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 10:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1772189713; x=1772794513; i=marcel@ziswiler.com;
	bh=JyFGZnhkCDmplKwplIYatSCSWGTAEQ+3aRFjhHnYafc=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kvaOnlAQi+lwkujcaUXQnO6rygGM08xpCHqocpHdxZAq+EUe54z6NtSg4kN8OAcu
	 O7Rclntg1NwDbiWloFpfvnQLASw8vkGN79sZZI+LiIO1uzjHG+q48X/GAL98xcUeO
	 Ne4p6js+PxJ15UHUkpoeUqiZ6OPQ11KsWA8YhUiALyItOrNvSPfW0E9n4yKyQh4gr
	 iPYdQMN3BkE+s4rk8xSlDB45MpNhTk3aEeZ7of2CT6WTkuZBcudMvJjcz3sKOrsGd
	 /ErBldEDbPwKKGBoEi98UU5jpWe88JFzHvzw4rcidh3Lluka4iaeY4CiNkKcbzGzz
	 An4df2cAcC2VnvnZ3Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus002
 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MfFYy-1wKaBm3H4s-00XVO9; Fri, 27 Feb
 2026 11:55:13 +0100
Message-ID: <d4e44b3659859e8967a1cee7cbbeeeeb399a4536.camel@ziswiler.com>
Subject: Re: [PATCH v3 00/22] riscv: Memory type control for platforms with
 physical memory aliases
From: Marcel Ziswiler <marcel@ziswiler.com>
To: patchwork-bot+linux-riscv@kernel.org, Samuel Holland
	 <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org, 
	devicetree@vger.kernel.org, surenb@google.com,
 linux-kernel@vger.kernel.org, 	rppt@kernel.org, mhocko@suse.com,
 conor@kernel.org, lorenzo.stoakes@oracle.com, 	krzk+dt@kernel.org,
 alex@ghiti.fr, kernel@esmil.dk, robh+dt@kernel.org, 	vbabka@suse.cz,
 Liam.Howlett@oracle.com, apw@canonical.com, 	dwaipayanray1@gmail.com,
 joe@perches.com, Julia.Lawall@inria.fr, 	lukas.bulwahn@gmail.com,
 nicolas.palix@imag.fr
Date: Fri, 27 Feb 2026 11:54:54 +0100
In-Reply-To: <176613180179.3684357.1299267450443574866.git-patchwork-notify@kernel.org>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
	 <176613180179.3684357.1299267450443574866.git-patchwork-notify@kernel.org>
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:UUplK9QahItW7favaUm4Q5d915hat+h5jRewnwaVbhTw3M+iOKz
 NivRKam2ukd6XrGztVMAx7ufnqFaS0o0H8sAT8En/yEU0449jeV6Yxky+IHFvxmzpiIHgqc
 e+oTWRBAZrV/b9JQcTj37R2Sw37SqeYcqEsP05M7zjZyx42P7HmWzbZLugPhPEWO73Nwlya
 she/PX5fYi+oGB3VOdNGg==
UI-OutboundReport: notjunk:1;M01:P0:+OThauVM/dQ=;T3PrC/aB3MTcKDZ+nVQmVOqdEzy
 N2dU66/j0l3knCkOxj2rAa+UJg/YnO5J1PIzW6lESBJD6kbcdblu29UNdIdexnMyMo5TD7mLi
 xESeyHnrqswHRBgoTrLyF4z8EkmVVcf159QIUGcYwNsoHmlt2GqMJpl3Jlfq6X6vUoeCvW4Qw
 EpGJ8jHXrd/cdgRe0UTOeoG8ItQxw58irA8JBh3osLS3KQoaJ7jVaFGN3ClT65DPL+e4q+iwU
 G7h6mnG1tsz6MXmFgemKc/9RFQ8XiJYXoQLHLr5+8cStFq2o+hNptRm5XB1XIeN8d/5CLPapC
 PHUyXxQAsqvWlNydi2rKGqFDL3qXSV2RQLmWH6PgEtDKnOE7BwEsmFyeY4U3GBeBc+7ND5voB
 EymOExcGAtoMaudGa3ODaRMiXG+zwzfDm15svkSNXeQU+vo8H+8lgzRtJNVLJdeQTiR3mTCOF
 7CscIhpLNsE/hHOd2Rch2OboqBLstKm8IbvCsKvXSIIuzM6LwAbOVAryP7H5z8hu9ACpF/w+d
 TzQJXjoTKtExhIns58/uDKt/FtqAr0HjPbmyOslIxYKWckkY9qq3aviEEOXzas6z7eFy6HHaQ
 hDnWevq1H9cXkwhc2iH0/U6TRNP48auqCeXyX+oaDv5P5pFU0AcFkmfKydm5UzBS3hGDGrZI2
 nZx6pwYAv5X04i6sc+vZb7J+WJg9S8xKErLFlnBxYU8g+lrl2I8cc3X/TUPz5rLO+EMBMpGWM
 KY4yMDBgChMOWfyFl4ju+copjhjJM+91bO+Y4SytOJ9sLq3JwWxuoQwJNFkQ8tt9ybvhItoMH
 DPmzdUlYciRUuQHVZAzNO6mXRKtov+xLyhVWnookBjNUUEBBI33VkoXKKphBhsJsVetJtkwhM
 byWhnSmGkTn7ok6pc9PC35OyJBiBOQN40yOfRj2AlKc7vfgaGqdwOtjMCGEjF/WDu6DZkrBt1
 zYcj4+M1OWxoy4+FZChdsX1auRtC7hXIKpzIKZcVyzlbbj9EOW/wifIbXzXy1f1+1eWsji9FG
 EjnDC2UfmcxsrQOueVdfMDddtKauvjq0kRl3OeDfUZMyhbAibXgCIjPagD1uXX3W7JDUIcl4b
 a1pPFbRPXgzxeVSb2iwy47sxyDrIOfNXsadHHiqKOl8x3p/CzRMo6ljG4tKtE/mG9/WdUvpLW
 9uPnvImuZ80X20rqPEqha2mMSy97lkrQsh0Oc8u4bx2IH/WltVVox1mXfcLPrJrj9uBBL1iR/
 jLtm7wyoOjakrucwgWhn0xsbBetL1xFlMPWS2dFvE+fnfgnti8e43NLDobz35JtA/X/RqZjgg
 P5mEyZdvdy6du3mbJuh1awV8wkGjXjFWoWV7IkcP4vrdzMPJYoBBLF8kuRItqQXJu8KbrTWOm
 to/3YCUwAlnXrM/JUQNMsKK9VOem1Q+iQXIiSwB7vxcn+CPwM+jteLn4LJ2YwtKTrw54BTd2h
 NBFxAFjRtRO48jN7+Rx5qGPd6tGGztTEEeFX6AC+yOxzNNFh0afUEOBaynVGMftjHK8Tp+0Ds
 GIRShmHNQoCBlDUCU11nTd13FkikovWXCQCqLBiBe/h3/XV58rGjtuuv6HezhlDQNA0oT7e+p
 Sq3KKjkzU9RuE4lFbHHkHFdg3q0CNE61wXE6QKU+Ue108FZt8pSZZsWIui2pg9mGA5j6rMzfi
 Z4GI4rJ8F/3zTi3qyYNxmEREKnbcSah2nJ9OGhkbAF0PzwAm9DdaRx7ZEqMwoF4qRxOc2lz2C
 1vAvmQX1rVRN0HtJM1f92+Oy90sRnGKBMTqQBU9MH/GYOGZ/rUL+Z9Q0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_025533_980584_72C3370F 
X-CRM114-Status: GOOD (  14.00  )
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

SGkgU2FtdWVsCgpPbiBGcmksIDIwMjUtMTItMTkgYXQgMDg6MTAgKzAwMDAsIHBhdGNod29yay1i
b3QrbGludXgtcmlzY3ZAa2VybmVsLm9yZyB3cm90ZToKPiBIZWxsbzoKPiAKPiBUaGlzIHNlcmll
cyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVzKQo+IGJ5IEFuZHJldyBNb3J0
b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+OgoKQW55IGlkZWEgd2hhdCBoYXBwZW5lZCB0
byBwYXRjaGVzIDA0LTIyIGFzIEkgZG9uJ3QgdGhpbmsgYW55dGhpbmcgb3RoZXIgdGhhbiBwYXRj
aGVzIDAxLTAzIGV2ZXIgZ290IGFwcGxpZWQKYW55d2hlcmUuIE9yIGFtIEkgbWlzc2luZyBhbnl0
aGluZz8KCkZvciB3aGF0IGl0J3Mgd29ydGggSSBjYXJyaWVkIGFuIHVwZGF0ZWQgcGF0Y2ggc2V0
IHRocm91Z2ggdXAgdG8gdjYuMTkuNCBbMV0gYW5kIGxhdGVzdCAtbmV4dCwgd2hpY2ggYXQgbGVh
c3QKb24gRUJDNzcgc2VlbXMgdG8gd29yayBmaW5lLgoKVGhhbmtzIQoKQ2hlZXJzCgpNYXJjZWwK
ClsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvbWV0YS1yaXNjdi9wdWxsLzYwMgoKPiBPbiBX
ZWQsIDEyIE5vdiAyMDI1IDE3OjQ1OjEzIC0wODAwIHlvdSB3cm90ZToKPiA+IE9uIHNvbWUgUklT
Qy1WIHBsYXRmb3JtcywgaW5jbHVkaW5nIFN0YXJGaXZlIEpINzEwMCBhbmQgRVNXSU4gRUlDNzcw
MCwKPiA+IERSQU0gaXMgbWFwcGVkIHRvIG11bHRpcGxlIHBoeXNpY2FsIGFkZHJlc3MgcmFuZ2Vz
LCB3aXRoIGVhY2ggYWxpYXMKPiA+IGhhdmluZyBhIGRpZmZlcmVudCBzZXQgb2Ygc3RhdGljYWxs
eS1kZXRlcm1pbmVkIFBoeXNpY2FsIE1lbW9yeQo+ID4gQXR0cmlidXRlcyAoUE1BcyksIHN1Y2gg
YXMgY2FjaGVhYmlsaXR5LiBTb2Z0d2FyZSBjYW4gYWx0ZXIgdGhlIFBNQXMgZm9yCj4gPiBhIHBh
Z2UgYnkgc2VsZWN0aW5nIGEgUEZOIGZyb20gdGhlIGNvcnJlc3BvbmRpbmcgcGh5c2ljYWwgYWRk
cmVzcyByYW5nZS4KPiA+IE9uIHRoZXNlIHBsYXRmb3JtcywgdGhpcyBpcyB0aGUgb25seSB3YXkg
dG8gYWxsb2NhdGUgbm9uY2FjaGVkIG1lbW9yeQo+ID4gZm9yIHVzZSB3aXRoIG5vbmNvaGVyZW50
IERNQS4KPiA+IAo+ID4gWy4uLl0KPiAKPiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6
Cj4gwqAgLSBbdjMsMDEvMjJdIG1tL3B0ZHVtcDogcmVwbGFjZSBSRUFEX09OQ0UoKSB3aXRoIHN0
YW5kYXJkIHBhZ2UgdGFibGUgYWNjZXNzb3JzCj4gwqDCoMKgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcmlzY3YvYy8xMTExOWIxOWY2MmQKPiDCoCAtIFt2MywwMi8yMl0gbW06IHJlcGxhY2UgUkVB
RF9PTkNFKCkgd2l0aCBzdGFuZGFyZCBwYWdlIHRhYmxlIGFjY2Vzc29ycwo+IMKgwqDCoCBodHRw
czovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvYzBlZmRiMzczYzNhCj4gwqAgLSBbdjMsMDMvMjJd
IG1tL2RpcnR5OiByZXBsYWNlIFJFQURfT05DRSgpIHdpdGggcHVkcF9nZXQoKQo+IMKgwqDCoCBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvYjRlNTM5ODRmMjQwCj4gwqAgLSBbdjMsMDQv
MjJdIHBlcmYvZXZlbnRzOiByZXBsYWNlIFJFQURfT05DRSgpIHdpdGggc3RhbmRhcmQgcGFnZSB0
YWJsZSBhY2Nlc3NvcnMKPiDCoMKgwqAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiDCoCAtIFt2Myww
NS8yMl0gbW06IE1vdmUgdGhlIGZhbGxiYWNrIGRlZmluaXRpb25zIG9mIHBYWHBfZ2V0KCkKPiDC
oMKgwqAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiDCoCAtIFt2MywwNi8yMl0gbW06IEFsd2F5cyB1
c2UgcGFnZSB0YWJsZSBhY2Nlc3NvciBmdW5jdGlvbnMKPiDCoMKgwqAgKG5vIG1hdGNoaW5nIGNv
bW1pdCkKPiDCoCAtIFt2MywwNy8yMl0gY2hlY2twYXRjaDogV2FybiBvbiBwYWdlIHRhYmxlIGFj
Y2VzcyB3aXRob3V0IGFjY2Vzc29ycwo+IMKgwqDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQo+IMKg
IC0gW3YzLDA4LzIyXSBtbTogQWxsb3cgcGFnZSB0YWJsZSBhY2Nlc3NvcnMgdG8gYmUgbm9uLWlk
ZW1wb3RlbnQKPiDCoMKgwqAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiDCoCAtIFt2MywwOS8yMl0g
cmlzY3Y6IGhpYmVybmF0ZTogUmVwbGFjZSBvcGVuLWNvZGVkIHBYWHBfZ2V0KCkKPiDCoMKgwqAg
KG5vIG1hdGNoaW5nIGNvbW1pdCkKPiDCoCAtIFt2MywxMC8yMl0gcmlzY3Y6IG1tOiBBbHdheXMg
dXNlIHBhZ2UgdGFibGUgYWNjZXNzb3IgZnVuY3Rpb25zCj4gwqDCoMKgIChubyBtYXRjaGluZyBj
b21taXQpCj4gwqAgLSBbdjMsMTEvMjJdIHJpc2N2OiBtbTogU2ltcGxpZnkgc2V0X3A0ZCgpIGFu
ZCBzZXRfcGdkKCkKPiDCoMKgwqAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiDCoCAtIFt2MywxMi8y
Ml0gcmlzY3Y6IG1tOiBEZWR1cGxpY2F0ZSBfUEFHRV9DSEdfTUFTSyBkZWZpbml0aW9uCj4gwqDC
oMKgIChubyBtYXRjaGluZyBjb21taXQpCj4gwqAgLSBbdjMsMTMvMjJdIHJpc2N2OiBwdGR1bXA6
IE9ubHkgc2hvdyBOIGFuZCBNVCBiaXRzIHdoZW4gZW5hYmxlZCBpbiB0aGUga2VybmVsCj4gwqDC
oMKgIChubyBtYXRjaGluZyBjb21taXQpCj4gwqAgLSBbdjMsMTQvMjJdIHJpc2N2OiBtbTogRml4
IHVwIG1lbW9yeSB0eXBlcyB3aGVuIHdyaXRpbmcgcGFnZSB0YWJsZXMKPiDCoMKgwqAgKG5vIG1h
dGNoaW5nIGNvbW1pdCkKPiDCoCAtIFt2MywxNS8yMl0gcmlzY3Y6IG1tOiBFeHBvc2UgYWxsIHBh
Z2UgdGFibGUgYml0cyB0byBhc3NlbWJseSBjb2RlCj4gwqDCoMKgIChubyBtYXRjaGluZyBjb21t
aXQpCj4gwqAgLSBbdjMsMTYvMjJdIHJpc2N2OiBhbHRlcm5hdGl2ZTogQWRkIGFuIEFMVEVSTkFU
SVZFXzMgbWFjcm8KPiDCoMKgwqAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiDCoCAtIFt2MywxNy8y
Ml0gcmlzY3Y6IGFsdGVybmF0aXZlOiBBbGxvdyBjYWxscyB3aXRoIGFsdGVybmF0ZSBsaW5rIHJl
Z2lzdGVycwo+IMKgwqDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQo+IMKgIC0gW3YzLDE4LzIyXSBy
aXNjdjogRml4IGxvZ2ljIGZvciBzZWxlY3RpbmcgRE1BX0RJUkVDVF9SRU1BUAo+IMKgwqDCoCAo
bm8gbWF0Y2hpbmcgY29tbWl0KQo+IMKgIC0gW3YzLDE5LzIyXSBkdC1iaW5kaW5nczogcmlzY3Y6
IERlc2NyaWJlIHBoeXNpY2FsIG1lbW9yeSByZWdpb25zCj4gwqDCoMKgIChubyBtYXRjaGluZyBj
b21taXQpCj4gwqAgLSBbdjMsMjAvMjJdIHJpc2N2OiBtbTogVXNlIHBoeXNpY2FsIG1lbW9yeSBh
bGlhc2VzIHRvIGFwcGx5IFBNQXMKPiDCoMKgwqAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKPiDCoCAt
IFt2MywyMS8yMl0gcmlzY3Y6IGR0czogc3RhcmZpdmU6IGpoNzEwMDogVXNlIHBoeXNpY2FsIG1l
bW9yeSByYW5nZXMgZm9yIERNQQo+IMKgwqDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQo+IMKgIC0g
W3YzLDIyLzIyXSByaXNjdjogZHRzOiBlc3dpbjogZWljNzcwMDogVXNlIHBoeXNpY2FsIG1lbW9y
eSByYW5nZXMgZm9yIERNQQo+IMKgwqDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQo+IAo+IFlvdSBh
cmUgYXdlc29tZSwgdGhhbmsgeW91IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
